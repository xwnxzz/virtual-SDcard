#!/system/bin/sh
# 卸载挂载点
umount /mnt/sdcard

# 恢复 storage.xml
if [ -f /data/system/storage.xml.bak ]; then
    mv /data/system/storage.xml.bak /data/system/storage.xml
    chmod 600 /data/system/storage.xml
fi

# 删除挂载点
rmdir /mnt/sdcard
