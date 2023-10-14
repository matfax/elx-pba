package deps

import (
	"github.com/u-root/u-root/cmds/exp/dmidecode"
	"github.com/u-root/u-root/cmds/exp/page"
	"github.com/u-root/u-root/cmds/exp/partprobe"
	"github.com/matfax/elx-pba/cmd/pbainit"
	"github.com/matfax/go-tcg-storage/cmd/sedlockctl"
	"github.com/u-root/u-root/cmds/boot/boot"
	"github.com/u-root/u-root/cmds/boot/fbnetboot"
	"github.com/u-root/u-root/cmds/boot/localboot"
	"github.com/u-root/u-root/cmds/boot/systemboot"
	"github.com/u-root/u-root/cmds/core/cmp"
	"github.com/u-root/u-root/cmds/core/elvish"
	"github.com/u-root/u-root/cmds/core/gosh"
	"github.com/u-root/u-root/cmds/core/gpgv"
	"github.com/u-root/u-root/cmds/core/pci"
	"github.com/u-root/u-root/cmds/core/sluinit"
)
