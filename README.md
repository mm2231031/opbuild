# 用于编译Lean源码的简易容器脚本

## 前置准备

### 系统要求

1. 要求1core以上的处理器，至少2GB以上系统内存，2GB的swap空间；

2. 要求40GB以上的磁盘空间，用于存放编译目录

3. 必须使用支持Linux docker的操作系统

4. 已经安装docker并能正常使用

## 使用方法


### 安装docker

复制执行，需要sudo或root权限，直接root执行请去掉sudo

    export MYUSER=$(whoami) 
    sudo curl -sSL https://get.docker.com |bash ||sudo  wget –qO- https://get.docker.com |bash 
    sudo usermod -aG docker $MYUSER #root用户不需要执行这条命令

### 生成命令

    # 指定源码存放路径(自行修改)
    export OPDIR=/opt/youdir

    # 生成命令
    sudo cat >/etc/profile.d/opbuild.sh <<EOF
    #!/bin/bash
    alias opmake="docker run -it --rm -v $OPDIR:/opt/opbuild jackmo233/opbuild:latest /src/opbuild.sh "
    EOF
    
    # 重新载入环境变量
    source /etc/profile

### 命令格式

首次运行会自动下载镜像

    # 升级/获取源码
    opmake pull

    # 配置编译选项
    opmake conf

    # 开始编译
    opmake make

    # 预下载dl包（不推荐）
    opmake dl

### 升级(没问题无需升级)

    docker rmi jackmo233/opbuild:latest && docker pull jackmo233/opbuild:latest

### 卸载

    rm -rf /etc/profile.d/opbuild.sh &&docker rmi jackmo233/opbuild:latest
    
## 自己生产镜像

### 下载Dockerfile （用vim打开Dockerfile，按照提示修改）

    git clone https://github.com/mm2231031/opbuild.git

### 生产镜像

    cd opbuild
    docker build --tag myopmake:latest ./

### 生成编译命令

    # 指定编译存放路径
    export OPDIR={youdir}

    # 使用alias生成编译命令
    cat >/etc/profile.d/opbuild.sh <<EOF
    #!/bin/bash
    alias opmake="docker run -it --rm -v $OPDIR:/opt/opbuild myopmake:latest /src/opbuild.sh "
    EOF

    # 重新载入环境变量
    source /etc/profile
