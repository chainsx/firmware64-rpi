cmd_../kernel/rootfs/usr/include/sound/.install := /bin/bash scripts/headers_install.sh ../kernel/rootfs/usr/include/sound ./include/uapi/sound hdspm.h emu10k1.h asound_fm.h tlv.h usb_stream.h skl-tplg-interface.h hdsp.h snd_sst_tokens.h compress_offload.h asoc.h asequencer.h sb16_csp.h asound.h compress_params.h firewire.h sfnt_info.h; /bin/bash scripts/headers_install.sh ../kernel/rootfs/usr/include/sound ./include/generated/uapi/sound ; touch ../kernel/rootfs/usr/include/sound/.install
