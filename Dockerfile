FROM docker.io/rockylinux:9.3@sha256:d644d203142cd5b54ad2a83a203e1dee68af2229f8fe32f52a30c6e1d3c3a9e0
MAINTAINER Grzegorz Makowski (makowski.grzegorz@gmail.com) 

ENV PATH=$PATH:/usr/ProReports.utf8
ENV VERSION=3.1.29h.r62
ENV JAVA_HOME=/usr/ProReports.utf8/JRE/openjdk1.8.0_412
ENV TZ=Europe/Warsaw

EXPOSE 8080

RUN cd /usr/ && \
    curl "https://s3.eu-central-1.amazonaws.com/proreports/ProReports-v${VERSION}-utf8/ProReports.utf8-lin.tar.gz" -o ProReports.utf8-lin.tar.gz &&\
    tar xvzf ProReports.utf8-lin.tar.gz && \
    rm -f ProReports.utf8-lin.tar.gz && \
    useradd -U prorepo && \
    chown -R prorepo:prorepo ProReports.utf8 && \
    cd /usr/ProReports.utf8 
USER prorepo
WORKDIR /usr/ProReports.utf8
CMD ["/bin/sh","-c","/usr/ProReports.utf8/start-docker.sh"]
