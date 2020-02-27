FROM sentry:9.1.2-onbuild

MAINTAINER Cookie

WORKDIR /root/

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse \n \
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse \n \
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse \n \
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse \n \
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse \n \
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse \n \
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse \n \
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse \n \
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse \n \
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse \n " > /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y vim telnet gnupg2 procps --allow-unauthenticated

RUN pip install django-smtp-ssl==1.0
RUN sed -i "s/= 'smtp'/= 'django_smtp_ssl.SSLEmailBackend'/g" /etc/sentry/sentry.conf.py



