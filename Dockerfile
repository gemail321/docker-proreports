FROM centos:centos7
MAINTAINER Grzegorz Makowski (makowski.grzegorz@gmail.com) 

ENV PATH=$PATH:/usr/ProReports.utf8
ENV VERSION=3.1.29h.r62
ENV JAVA_HOME=/usr/ProReports.utf8/JRE/openjdk1.8.0_275
ENV TZ=Europe/Warsaw

EXPOSE 8080

RUN cd /usr/ && \
    echo "firewall-cmd --zone=public --add-port=8080/tcp" >>/etc/rc.local && \
    echo "firewall-cmd --reload" >>/etc/rc.local && \
    yum -y install wget && \
    wget "https://s3.eu-central-1.amazonaws.com/proreports/ProReports-v${VERSION}-utf8/ProReports.utf8-lin.tar.gz" &&\
    tar xvzf ProReports.utf8-lin.tar.gz && \
    rm -f ProReports.utf8-lin.tar.gz && \
    useradd -U prorepo && \
    chown -R prorepo:prorepo ProReports.utf8 && \
    cd /usr/ProReports.utf8 
USER prorepo
WORKDIR /usr/ProReports.utf8
CMD ["/bin/sh","-c","/usr/ProReports.utf8/start-docker.sh"]
