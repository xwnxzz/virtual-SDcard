#!/system/bin/sh
sleep 15

MODDIR=${0%/*}

# 确保挂载点存在
mkdir -p /mnt/sdcard

# 挂载块设备
mount -o rw /dev/block/by-name/rannki /mnt/sdcard

# 修改 storage.xml 文件以识别为 SD 卡
if [ -f /data/system/storage.xml ]; then
    # 备份原文件
    cp /data/system/storage.xml /data/system/storage.xml.bak

    # 插入 SD 卡配置
    sed -i '/<volumes>/a\    <volume mountPoint="/mnt/sdcard" fsType="vfat" state="mounted" removable="true" emulated="false" owner="0" />' /data/system/storage.xml

    # 确保权限正确
    chmod 600 /data/system/storage.xml
fi
