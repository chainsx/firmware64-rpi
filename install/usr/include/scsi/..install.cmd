cmd_../kernel/rootfs/usr/include/scsi/.install := /bin/bash scripts/headers_install.sh ../kernel/rootfs/usr/include/scsi ./include/uapi/scsi scsi_bsg_ufs.h cxlflash_ioctl.h scsi_netlink.h scsi_netlink_fc.h scsi_bsg_fc.h; /bin/bash scripts/headers_install.sh ../kernel/rootfs/usr/include/scsi ./include/generated/uapi/scsi ; touch ../kernel/rootfs/usr/include/scsi/.install
