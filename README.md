# 用于编译Lean源码的简易容器脚本

## 前置准备

### 系统要求

1.要求1core以上的处理器，至少2GB以上系统内存，2GB的swap空间；

2.要求40GB以上的磁盘空间，用于存放编译目录

3.必须使用支持Linux docker的操作系统

## 使用方法

### 下载Dockerfile

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
### 命令格式

    # 升级/获取源码
    opmake update

    # 配置编译选项
    opmake config

    # 开始编译
    opmake make

    # 预下载dl包（不推荐）
    opmake download

## 使用预先生成的docker镜像

### 下载docker镜像

    docker push jackmo233/opbuild

### 生成命令

    # 指定源码存放路径
    export OPDIR=/opt/youdir

    # 生成命令
    cat >/etc/profile.d/opbuild.sh <<EOF
    #!/bin/bash
    alias opmake="docker run -it --rm -v $OPDIR:/opt/opbuild jackmo233/opbuild:latest /src/opbuild.sh "
    EOF
    
    # 重新载入环境变量
    source /etc/profile
