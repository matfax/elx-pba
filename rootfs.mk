ifeq ($(ARCH),x86_64)
GOARCH := amd64
endif

<<<<<<< HEAD
rootfs-$(ARCH).cpio: $(GOPATH)/bin/u-root $(wildcard cmd/*/*.go)
	$(GOPATH)/bin/u-root \
				-o "$(@)" \
				-build=gbb \
				-initcmd pbainit \
				$(UROOT_FLAGS) \
				boot \
				core \
				github.com/u-root/u-root/cmds/exp/dmidecode \
				github.com/u-root/u-root/cmds/exp/page \
				github.com/u-root/u-root/cmds/exp/partprobe \
				$(PWD)/cmd/pbainit \
				github.com/matfax/go-tcg-storage/cmd/sedlockctl
=======
rootfs-$(ARCH).cpio: go/bin/u-root $(wildcard cmd/*/*.go) 
	go/bin/u-root \
		-o "$(@)" \
		-build=gbb \
		-initcmd pbainit \
		github.com/u-root/u-root/cmds/boot/* \
		github.com/u-root/u-root/cmds/core/* \
		github.com/u-root/u-root/cmds/exp/dmidecode \
		github.com/u-root/u-root/cmds/exp/page \
		github.com/u-root/u-root/cmds/exp/partprobe \
		github.com/elastx/elx-pba/cmd/pbainit \
		github.com/open-source-firmware/go-tcg-storage/cmd/sedlockctl 

#		github.com/open-source-firmware/go-tcg-storage/cmd/tcgdiskstat \
#		github.com/open-source-firmware/go-tcg-storage/cmd/tcgsdiag 

rootfs-interactive-$(ARCH).cpio: go/bin/u-root $(wildcard cmd/*/*.go)
	go/bin/u-root \
		-o "$(@)" \
		-build=gbb \
		-initcmd pbainit-interactive \
		github.com/u-root/u-root/cmds/boot/* \
		github.com/u-root/u-root/cmds/core/* \
		github.com/u-root/u-root/cmds/exp/dmidecode \
		github.com/u-root/u-root/cmds/exp/page \
		github.com/u-root/u-root/cmds/exp/partprobe \
		github.com/elastx/elx-pba/cmd/pbainit-interactive \
		github.com/open-source-firmware/go-tcg-storage/cmd/sedlockctl

#		github.com/open-source-firmware/go-tcg-storage/cmd/tcgdiskstat \
#		github.com/open-source-firmware/go-tcg-storage/cmd/tcgsdiag

>>>>>>> upstream/main
