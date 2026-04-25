#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part5-6.6.sh
# Description: OpenWrt DIY script part 5 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.6.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# Modify default theme
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
# sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

cat > package/emortal/autocore/files/arm/tempinfo << 'EOF'
#!/bin/sh

THERMAL_PATH="/sys/class/thermal/thermal_zone0/temp"

if [ -f "$THERMAL_PATH" ]; then
    cpu_temp="$(awk '{printf("%.1f°C", $0 / 1000)}' "$THERMAL_PATH")"
    echo -n "CPU: ${cpu_temp}"
fi
EOF
chmod +x package/emortal/autocore/files/arm/tempinfo

sed -i 's/ \/ Wireless HNAT Disabled//g' package/mtk/applications/luci-app-turboacc-mtk/root/usr/libexec/rpcd/luci.turboacc

# rm -f /etc/config/wireless
# rm -f /tmp/luci-indexcache.*.json
# /etc/init.d/rpcd restart