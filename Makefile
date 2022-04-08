
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

echo:
	echo Hello from zato-vagrant
