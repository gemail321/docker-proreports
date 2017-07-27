FROM centos
MAINTAINER Grzegorz Makowski (makowski.grzegorz@gmail.com)
ENV PATH=$PATH:/usr/ProReports.utf8
ENV JAVA_HOME=/usr/ProReports.utf8/JRE/jre1.8.0_121

RUN cd /usr/ && \
    yum -y install wget && \
	wget https://sourceforge.net/projects/proreports/files/ProReports-v3.1.29h.r29-utf8/ProReports.utf8-lin.tar.gz/download &&\
    tar xvzf ProReports.utf8-lin.tar.gz && \
	rm -f ProReports.utf8-lin.tar.gz && \
	cd /usr/ProReports.utf8 
WORKDIR /usr/ProReports.utf8
CMD startrepo.sh && bash	