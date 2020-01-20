#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:56e2daf4edfcb00cd89b660b43e755c0f6ba86d4; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:537da49f1bdf2e2952fc5af56bd03a11897b05c3 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:56e2daf4edfcb00cd89b660b43e755c0f6ba86d4 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
