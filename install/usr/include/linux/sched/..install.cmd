cmd_../kernel/include/linux/sched/.install := /bin/bash scripts/headers_install.sh ../kernel/include/linux/sched ./include/uapi/linux/sched types.h; /bin/bash scripts/headers_install.sh ../kernel/include/linux/sched ./include/generated/uapi/linux/sched ; touch ../kernel/include/linux/sched/.install
