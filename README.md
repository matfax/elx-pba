# elx-pba

![GitHub commit checks state](https://img.shields.io/github/checks-status/matfax/elx-pba/main?label=ci)
[![Go Report Card](https://goreportcard.com/badge/github.com/matfax/elx-pba)](https://goreportcard.com/report/github.com/matfax/elx-pba)
![License](https://img.shields.io/badge/license-Apache--2.0-blue)

Pre-boot authentication image for TCG Storage devices

## Building

**NOTE**: Use a Go version of 1.17 or higher.

```shell
$ sudo apt install \
    gnupg2 gpgv2 flex bison build-essential libelf-dev \
    curl libssl-dev bc zstd dosfstools fdisk gdisk mtools
$ gpg2 --locate-keys torvalds@kernel.org gregkh@kernel.org autosigner@kernel.org

# Make sure sgdisk is in the PATH
$ PATH=$PATH:/sbin make
```

Alternatively, use the containerized build tools:

```shell
$ docker build \
	-t elastx.se/elx-pba-builder:latest \
	-f builder.dockerfile .
$ docker run \
	--rm --volume ${PWD}:/src \
	elastx.se/elx-pba-builder:latest
```


## Testing in a VM

```shell
$ sudo apt install qemu-system-x86
$ make qemu-x86_64
```

## Testing on a real disk

```shell
$ OPAL_KEY=debug
$ sudo sedutil-cli --loadpbaimage "${OPAL_KEY}" elx-pba-x86_64.img /dev/sdb
```
