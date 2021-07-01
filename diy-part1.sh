#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
 sed -i '$a src-git helloworld https://github.com/fw876/helloworld' ./feeds.conf.default

# 添加额外软件包
git clone https://github.com/jerrykuku/lua-maxminddb.git ./package/lean/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git ./package/lean/luci-app-vssr
git clone https://github.com/xiaorouji/openwrt-passwall.git ./package/lean/openwrt-passwall
git clone https://github.com/fw876/helloworld.git ./package/lean/helloworld

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings
