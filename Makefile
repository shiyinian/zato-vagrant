
.PHONY: build
MAKEFLAGS += --silent

default: echo

ZATO_ANSIBLE_DIR=$(CURDIR)/zato-ansible

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
	$(MAKE) install-binaries
	$(MAKE) run-tests

echo:
	echo Hello from zato-vagrant

serve:
	cd $(CURDIR)/quickstart && \
		vagrant \
		--host-dashboard-port=8185 \
		--host-server-port=17085 \
		--host-lb-port=11285 \
		--host-ssh-port=22085 \
		up \
		--provision

ssh:
	cd $(CURDIR)/quickstart && \
		vagrant ssh
