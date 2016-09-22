FROM blacklabelops/rsnapshot
MAINTAINER Gerónimo Afonso <geronimo.mikroways.net>

#RUN yum install -y epel-release && \
#    yum install -y openssh-clients openssh-server && \
#    yum clean all && rm -rf /var/cache/yum/*

COPY docker-entrypoint.sh /usr/bin/rsnapshot.d/docker-entrypoint.sh
COPY rsnapshot.conf /usr/bin/rsnapshot.d/rsnapshot.conf



RUN chmod +x /usr/bin/rsnapshot.d/docker-entrypoint.sh
VOLUME /root/.ssh
#RUN mkdir /var/keys-rsnap

#VOLUME /var/keys-rsnap
