ARCH ?= $(shell uname -m)
LINUX_VERSION ?= 6.1.58
UROOT_GIT_REF ?= v0.14.0

ifeq ($(shell uname),Linux)
ACCEL ?= kvm
else ifeq ($(shell uname),Darwin)
ACCEL ?= hvf
else
ACCEL ?= tcg
endif

.PHONY: checksum
checksum: elx-pba-$(ARCH).img elx-pba-interactive-$(ARCH).img
	sha256sum elx-pba-*.img | tee SHA256SUMS

.PHONY: all
all: elx-pba-$(ARCH).img elx-pba-interactive-$(ARCH).img checksum

.EXPORT_ALL_VARIABLES:
GOPATH = $(PWD)/go
UROOT_PATH = $(PWD)/go/src/github.com/u-root/u-root 
GBB_PATH = $(PWD):$(PWD)/go/src/github.com/u-root/u-root

.DELETE_ON_ERROR:

include kernel.mk
include u-root.mk
include rootfs.mk
include image.mk

.PHONY: qemu-x86_64
qemu-x86_64: elx-pba-x86_64.img arch/x86_64/ovmf.fd
	qemu-system-x86_64 \
		-m 1024 \
		-uuid 00000000-0000-0000-0000-000000000001 \
		-smbios type=1,serial=SYSTEM01 \
		-smbios type=2,serial=BOARD01 \
		-smbios type=3,serial=CHASSIS01 \
		-device "virtio-scsi-pci,id=scsi0" \
		-device "scsi-hd,bus=scsi0.0,drive=hd0" \
		-drive "id=hd0,if=none,format=raw,readonly=on,file=$<" \
		-drive "if=pflash,format=raw,readonly,file=arch/x86_64/ovmf.fd" \
		-accel "$(ACCEL)" \
		-machine "type=q35,smm=on,usb=on" \
		-no-reboot

.PHONY: qemu-x86_64-interactive
qemu-x86_64-interactive: elx-pba-interactive-x86_64.img arch/x86_64/ovmf.fd
	qemu-system-x86_64 \
		-m 1024 \
		-uuid 00000000-0000-0000-0000-000000000001 \
		-smbios type=1,serial=SYSTEM01 \
		-smbios type=2,serial=BOARD01 \
		-smbios type=3,serial=CHASSIS01 \
		-device "virtio-scsi-pci,id=scsi0" \
		-device "scsi-hd,bus=scsi0.0,drive=hd0" \
		-drive "id=hd0,if=none,format=raw,readonly=on,file=$<" \
		-drive "if=pflash,format=raw,readonly,file=arch/x86_64/ovmf.fd" \
		-accel "$(ACCEL)" \
		-machine "type=q35,smm=on,usb=on" \
		-no-reboot

.PHONY: clean
clean:
	\rm -vf elx-pba-*.img elx-pba-*.fs rootfs-*.img rootfs-*.cpio rootfs-*.zst go/bin/* SHA256SUMS

.PHONY: dist_clean
dist_clean: clean
	rm -rf $(GOPATH)/{bin,pkg,src}/* go linux-$(LINUX_VERSION).* linux-$(LINUX_VERSION) 
