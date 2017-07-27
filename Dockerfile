FROM centos
MAINTAINER Grzegorz Makowski 
ENV PATH=$PATH:/usr/ProReports.utf8
ENV JAVA_HOME=/usr/ProReports.utf8/JRE/jre1.8.0_121
COPY ProReports.utf8-lin.tar.gz /usr/
RUN cd /usr/ && \ 
    tar xvzf ProReports.utf8-lin.tar.gz && \
	rm -f ProReports.utf8-lin.tar.gz && \
	export http_proxy=http://172.25.4.34:3128  && \
	yum -y install wget && \
	cd /usr/ProReports.utf8 
WORKDIR /usr/ProReports.utf8
CMD startrepo.sh && bash	