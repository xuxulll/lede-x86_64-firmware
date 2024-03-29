#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.31.2/g' package/base-files/files/bin/config_generate

# Clone extra packages
# git clone -b v0.42.10-beta --recursive https://github.com/vernesong/OpenClash package/openclash
curl -L https://github.com/vernesong/OpenClash/archive/refs/tags/v0.45.129-beta.tar.gz > openclash.tar.gz
tar -zxvf openclash.tar.gz
mkdir package/openclash
cp -R OpenClash-0.45.129-beta/luci-app-openclash package/openclash/luci-app-openclash
#git clone --recursive https://github.com/kenzok8/openwrt-packages package/kenzok
#git clone --recursive https://github.com/kenzok8/small package/small
git clone --recursive https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# Replace default Argon Theme
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

git clone --recursive https://github.com/rufengsuixing/luci-app-adguardhome.git package/lean/luci-app-adguardhome

# Remove built-in duplicated packages
#rm -rf package/lean/aliyundrive-webdav
#rm -rf package/lean/luci-app-aliyundrive-webdav
#rm -rf package/lean/luci-app-jd-dailybonus
#rm -rf package/lean/luci-app-pushbot
#rm -rf package/lean/microsocks
#rm -rf package/lean/redsocks2
#rm -rf package/lean/dns2socks
#rm -rf package/lean/ipt2socks
#rm -rf package/lean/pdnsd-alt
#rm -rf package/lean/simple-obfs
#rm -rf package/lean/trojan
