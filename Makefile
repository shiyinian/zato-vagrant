
.PHONY: build
MAKEFLAGS += --silent

default: echo

ZATO_ANSIBLE_DIR=$(CURDIR)/zato-ansible

git-sync:
	cd $(ZATO_ANSIBLE_DIR)
	git submodule update --init --recursive
	git checkout main
	cd ..
	git add .
	git add zato-ansible
	git commit -m "GH #1 - Pulling latest changes from zato-ansible." || true
	git push || true

install-binaries:
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
	sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
	sudo apt-get update && sudo apt-get install vagrant

	wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install virtualbox

run-tests:
	cd $(CURDIR)/quickstart && vagrant destroy -f && vagrant --vm-name=zatotest --run-internal-qs-step-01=true --run-internal-qs-step-02=true --run-internal-tests=true up --provision

all-sync-install-test:
	$(MAKE) git-sync
	$(MAKE) install-binaries
	$(MAKE) run-tests

echo:
	echo Hello from zato-vagrant
