# Pull base image 
#From tomcat:8-jre8 
#ADD ./webapp.war /usr/local/tomcat/webapps
#ADD ./target/*.war /opt/tomcat/webapps/
#WORKDIR /opt/tomcat/webapps
#EXPOSE 8090
#CMD ["catalina.sh", "run"]
#RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
FROM centos
WORKDIR /opt
RUN yum update -y
RUN yum install wget -y
RUN wget https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u282-b08/OpenJDK8U-jdk_x64_linux_hotspot_8u282b08.tar.gz
RUN tar -zxvf OpenJDK8U-jdk_x64_linux_hotspot_8u282b08.tar.gz
RUN mv jdk8u282-b08 java8
RUN wget https://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz
RUN tar -zxvf apache-tomcat-8.5.69.tar.gz
RUN mv apache-tomcat-8.5.69 tomcat8
#ADD ./webapp.war /opt/tomcat/webapps
WORKDIR /opt/tomcat8/webapps
RUN wget https://rajujenkins.s3.ap-south-1.amazonaws.com/webapp/target/webapp.war
RUN echo export JAVA_HOME=/opt/java8 >> /etc/profile
RUN echo export PATH=$PATH:/opt/java8/bin >> /etc/profile
ENV JAVA_HOME "/opt/java8"
ENV PATH "${JAVA_HOME}/bin:${PATH}"
CMD ["/opt/tomcat8/bin/catalina.sh", "run"]
