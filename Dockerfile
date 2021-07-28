#!/bin/bash
From centos
MAINTAINER "rajusharavanda"
RUN chmod 777 /opt
RUN cd /opt
RUN yum install wget -y
RUN wget https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u292-b10/OpenJDK8U-jdk_x64_linux_hotspot_8u292b10.tar.gz
RUN tar -xvf OpenJDK8U-jdk_x64_linux_hotspot_8u292b10.tar.gz
RUN mv  jdk8u292-b10 java8
RUN rm -rf OpenJDK8U-jdk_x64_linux_hotspot_8u292b10.tar.gz
RUN sed -i '$a export JAVA_HOME=/opt/java8' /etc/profile
RUN sed -i '$a export PATH=$PATH:/opt/java8/bin' /etc/profile
RUN cd /opt
RUN wget https://mirrors.estointernet.in/apache/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
RUN tar -xvf apache-maven-3.8.1-bin.tar.gz
RUN mv apache-maven-3.8.1 maven3
RUN sed -i '$a export M2_HOME=/opt/maven3' /etc/profile
RUN sed -i '$a export PATH=$PATH:/opt/mavne3/bin' /etc/profile
RUN cd /opt
RUN wget http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.23/bin/apache-tomcat-8.0.23.tar.gz
RUN tar -xvf apache-tomcat-8.0.23.tar.gz
RUN rm -rf apache-tomcat-8.0.23.tar.gz
RUN mv apache-tomcat-8.0.23 tomcat
COPY ./webapp.war /opt/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh","run"]
