cmd_linux/include/asm-generic/.install := /bin/bash scripts/headers_install.sh linux/include/asm-generic ./include/uapi/asm-generic siginfo.h sembuf.h fcntl.h errno.h termios.h ipcbuf.h posix_types.h ioctls.h msgbuf.h poll.h socket.h termbits.h swab.h sockios.h resource.h kvm_para.h signal.h auxvec.h mman.h statfs.h ucontext.h param.h mman-common.h int-ll64.h errno-base.h unistd.h bitsperlong.h shmparam.h shmbuf.h ioctl.h int-l64.h stat.h setup.h types.h hugetlb_encode.h signal-defs.h; /bin/bash scripts/headers_install.sh linux/include/asm-generic ./include/generated/uapi/asm-generic ; touch linux/include/asm-generic/.install
