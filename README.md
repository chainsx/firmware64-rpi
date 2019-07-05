# 5.2内核(64位)

## 新增了64位VC4

#### 64位VC4将会被安装在/opt/vc下

### 适用于所有树莓派3的系统（包括raspbian）

## 内核安装方法

### 对于树莓派：

#### 克隆项目
`git clone --depth=1 -b dev https://github.com/chainsx/firmware64-rpi`
#### 安装内核
`cd firmware64-rpi/install && sh install.sh`
#### 重启
`reboot`


如果install.sh在你的系统上出现问题了的话，请[手动安装内核](https://github.com/chainsx/firmware64-rpi/wiki/手动安装内核)


内核打包
转到[此页面](https://github.com/chainsx/firmware64-rpi/releases)
注意：该deb安装文件不含vc4，安装vc4使用以上方法。
