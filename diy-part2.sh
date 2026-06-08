#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
# 自动编译 PassWall 2 主程序
echo 'CONFIG_PACKAGE_luci-app-passwall=y' >> .config

# 勾选 PassWall 2 的 Nftables 现代防火墙分流模块（N100 稳定版核心）
echo 'CONFIG_PACKAGE_luci-app-passwall_Nftables_Filtering=y' >> .config

# 自动打包 PassWall 2 所需的所有主流核心（Xray, Sing-Box, Trojan 等）
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_SingBox=y' >> .config

# 为 N100 开启内核级 BBR 拥塞控制算法（让网络长效运行更稳定、跑得更快）
echo 'CONFIG_KERNEL_BBR_NODELAY=y' >> .config
