cmd_../kernel/include/linux/hsi/.install := /bin/bash scripts/headers_install.sh ../kernel/include/linux/hsi ./include/uapi/linux/hsi hsi_char.h cs-protocol.h; /bin/bash scripts/headers_install.sh ../kernel/include/linux/hsi ./include/generated/uapi/linux/hsi ; touch ../kernel/include/linux/hsi/.install
