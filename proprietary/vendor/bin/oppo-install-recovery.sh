#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:c6748476e95dc9008c7fd33219cf7c90a77cfe74; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:7231f193932d440ea1552d27c007d3b6d3492243 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:c6748476e95dc9008c7fd33219cf7c90a77cfe74 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
