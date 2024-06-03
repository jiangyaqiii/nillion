#!/bin/bash

# 检查是否以root用户运行脚本
if [ "$(id -u)" != "0" ]; then
    echo "此脚本需要以root用户权限运行。"
    echo "请尝试使用 'sudo -i' 命令切换到root用户，然后再次运行此脚本。"
    exit 1
fi

#下载安装脚本
curl https://nilup.nilogy.xyz/install.sh | bash
source /root/.bashrc

#确认全局安装
nilup -V

#安装最新版本的 Nillion SDK
nilup install latest
nilup use latest
nilup init

#启用遥测
read -p "请输入你的ETH钱包地址: " your_eth_wallet_address
walletaddress="$your_eth_wallet_address"
nilup instrumentation enable --wallet $walletaddress
