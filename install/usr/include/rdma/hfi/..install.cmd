cmd_linux/include/rdma/hfi/.install := /bin/bash scripts/headers_install.sh linux/include/rdma/hfi ./include/uapi/rdma/hfi hfi1_ioctl.h hfi1_user.h; /bin/bash scripts/headers_install.sh linux/include/rdma/hfi ./include/generated/uapi/rdma/hfi ; touch linux/include/rdma/hfi/.install
