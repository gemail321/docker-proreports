FROM redhat/ubi8:latest
MAINTAINER IT-DT team (service@it-dt.pl) 

ENV PATH=$PATH:/usr/ProReports.utf8
ENV VERSION=3.1.29h.r64
ENV RELEASE=20251130
ENV JAVA_HOME=/usr/ProReports.utf8/JRE/openjdk1.8.0_472
ENV TZ=Europe/Warsaw

EXPOSE 8080

RUN cd /usr/ && \
    curl "https://s3.eu-central-1.amazonaws.com/proreports/ProReports-v${VERSION}-utf8/ProReports.utf8-lin.tar.gz" -o - | tar xvzf - &&\
    useradd -U prorepo && \
    chown -R prorepo:prorepo ProReports.utf8 && \
    cd /usr/ProReports.utf8 
USER prorepo
WORKDIR /usr/ProReports.utf8
CMD ["/bin/sh","-c","/usr/ProReports.utf8/start-docker.sh"]
