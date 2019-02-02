# 5.0内核(64位)
### 适用于所有树莓派3的系统（包括raspbian）
### 应要求新增了对于晶晨（Amlogic）（例如s905）,以及瑞芯微（Rockchip），还有全志（Allwinner）。

## 内核安装方法

### 对于树莓派：

#### 克隆项目
`git clone --depth=1 -b dev https://github.com/chainsx/firmware64-rpi`
#### 安装内核
`cd firmware64-rpi/install && sh install.sh`
#### 重启
`reboot`

### 对于其他芯片不能使用install.sh一键安装，请自行安装。

### 支持的芯片

- [X] Broadcom 2837 .

- [X] Amlogic arm64 family .

- [X] Rockchip arm64 family .

- [X] Allwinner sunxi arm64 family .

如果install.sh在你的系统上出现问题了的话，请[手动安装内核](https://github.com/chainsx/firmware64-rpi/wiki/手动安装内核)
