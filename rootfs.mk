ifeq ($(ARCH),x86_64)
GOARCH := amd64
endif

rootfs-$(ARCH).cpio: $(GOPATH)/bin/u-root $(wildcard cmd/*/*.go)
	$(GOPATH)/bin/u-root \
				-o "$(@)" \
				-build=gbb \
				-initcmd pbainit \
				boot \
				core \
				github.com/u-root/u-root/cmds/exp/dmidecode \
				github.com/u-root/u-root/cmds/exp/page \
				github.com/u-root/u-root/cmds/exp/partprobe \
				$(PWD)/cmd/pbainit \
				github.com/open-source-firmware/go-tcg-storage/cmd/sedlockctl
