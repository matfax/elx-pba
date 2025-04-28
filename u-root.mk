<<<<<<< HEAD
$(GOPATH)/bin/u-root:
	go install github.com/u-root/u-root@v0.11.0
=======
go/src/github.com/u-root/u-root/.git/HEAD:
	mkdir -p go/src/github.com/u-root/u-root/
	git clone https://github.com/u-root/u-root go/src/github.com/u-root/u-root
	cd go/src/github.com/u-root/u-root; git reset --hard $(UROOT_GIT_REF)

go/bin/u-root: go/src/github.com/u-root/u-root/.git/HEAD
	(cd go/src/github.com/u-root/u-root/; go install)

>>>>>>> upstream/main
