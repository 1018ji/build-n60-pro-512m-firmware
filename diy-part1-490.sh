#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Add ADGuardHome source
# git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
# chmod -R 755 ./package/luci-app-adguardhome/*

git clone https://github.com/sirpdboy/luci-app-adguardhome package/luci-app-adguardhome
chmod -R 755 ./package/luci-app-adguardhome/*

git clone https://github.com/EasyTier/luci-app-easytier/ package/luci-app-easytier
chmod -R 755 ./package/luci-app-easytier/*

sed -i 's/reg = <0x0580000 0x7280000>;/reg = <0x0580000 0x1ea00000>;/' target/linux/mediatek/dts/mt7986a-netcore-n60-pro.dts