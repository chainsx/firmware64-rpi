cmd_/root/firm//include/mtd/.install := /bin/bash scripts/headers_install.sh /root/firm//include/mtd ./include/uapi/mtd ubi-user.h mtd-abi.h inftl-user.h mtd-user.h nftl-user.h; /bin/bash scripts/headers_install.sh /root/firm//include/mtd ./include/generated/uapi/mtd ; touch /root/firm//include/mtd/.install
