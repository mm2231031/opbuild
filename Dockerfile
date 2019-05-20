FROM ubuntu:14.04
MAINTAINER Jack Mo <mo2231031@live.cn>
COPY build.sh /tmp/build.sh
COPY sources.list.trusty /etc/apt/sources.list
ADD src/ /src/
RUN /bin/bash /tmp/build.sh
USER opbuild
CMD /src/opbuild.sh
