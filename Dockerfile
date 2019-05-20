FROM ubuntu:14.04
MAINTAINER Jack Mo <mo2231031@live.cn>
COPY build.sh /tmp/build.sh
# 自定义构建请去掉下行注释
#COPY sources.list.trusty /etc/apt/sources.list 
ADD src/ /src/
RUN /bin/bash /tmp/build.sh
CMD /src/opbuild.sh
