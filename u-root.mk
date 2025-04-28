# Makefile for u-root

$(GOPATH)/src/github.com/u-root/u-root:
	git clone https://github.com/u-root/u-root $(GOPATH)/src/github.com/u-root/u-root
	cd $(GOPATH)/src/github.com/u-root/u-root; git reset --hard $(UROOT_GIT_REF)

$(GOPATH)/bin/u-root:
	go install github.com/u-root/u-root@$(UROOT_GIT_REF)
