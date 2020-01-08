FROM alpine:3.9
MAINTAINER GuoYuchao <ihidchaos@qq.com>
ENV LANG C.UTF-8
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
	&& buildDeps=" \
		build-base \
		cmake \
		git \
		linux-headers \
		openssl-dev \
		autoconf \
		automake \
		libtool \
	"; \
	apk add bash $buildDeps \
	&& mkdir -p /usr/src \
	&& cd /usr/src \
	&& git clone https://github.com/ntop/n2n.git \
	&& cd /usr/src/n2n \
	&& ./autogen.sh \
	&& ./configure \
	&& make \
	&& make install \
	&& cd / \
	&& rm -fr /usr/src/n2n \
	&& set -x \
	&& apk del $buildDeps \
	&& apk info \
	&& rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/sbin/supernode", "-l", "7654", "-f"]
