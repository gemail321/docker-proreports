FROM centos
MAINTAINER Grzegorz Makowski (makowski.grzegorz@gmail.com)

ARG VERSION
ARG JAVA_HOME

ENV PATH=$PATH:/usr/ProReports.utf8
ENV VERSION=${VERSION}
ENV JAVA_HOME=${JAVA_HOME}

RUN cd /usr/ && \
    yum -y install wget && \
	wget "https://sourceforge.net/projects/proreports/files/ProReports-v${VERSION}-utf8/ProReports.utf8-lin.tar.gz/download" &&\
    tar xvzf ProReports.utf8-lin.tar.gz && \
	rm -f ProReports.utf8-lin.tar.gz && \
	cd /usr/ProReports.utf8 
WORKDIR /usr/ProReports.utf8
CMD startrepo.sh && bash	
