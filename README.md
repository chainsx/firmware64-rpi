# 4.14内核(64位)
### 适用于所有树莓派3的系统（包括raspbian）

## 内核安装方法

#### 克隆项目
`git clone https://github.com/chainsx/firmware64-rpi`
#### 安装内核
`cd install && sh install.sh`
#### 重启
`reboot`

### 注：蓝牙，wifi的使用方法自行百度，注意，蓝牙使用前需要使用hciattach来配置。

- [X] Wirless Lan (WLAN)
- [X] Bluetooth (BT)
- [X] brcm80211
- [X] KVM
- [X] Chrome Virtual Environment
- [X] adi
- [X] atheros
- [X] bnx2x
- [X] ralink
- [X] realtek
- [X] qlogic
- [X] ipw2x00
- [X] ivtv
- [X] iwlwifi
- [X] myricom
- [X] netxen

如果install.sh在你的系统上出现问题了的话，请[手动安装内核](https://github.com/chainsx/firmware64-rpi/wiki/手动安装内核)
