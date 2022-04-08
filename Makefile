
.PHONY: build
MAKEFLAGS += --silent

default: echo

ZATO_ANSIBLE_DIR=$(CURDIR)/zato-ansible

git-sync:
	git submodule update --init --recursive
	cd $(ZATO_ANSIBLE_DIR)
	git checkout main
	git pull
	cd ..
	git add .
	git commit -m "GH #1 - Pulling latest changes from zato-ansible." || true
	git push || true

run-tests:
	sudo apt-get install vagrant -y
	cd $(CURDIR)/quickstart
	vagrant destroy && vagrant --run-internal-qs-step-01=true --run-internal-qs-step-02=true --run-internal-tests=true up --provision

run-all:
	$(MAKE) git-sync
	$(MAKE) run-tests

echo:
	echo Hello from zato-vagrant
