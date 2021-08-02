# Pull base image 
From tomcat:8-jre8 
ADD ./webapp.war /usr/local/tomcat/webapps
#ADD ./target/*.war /opt/tomcat/webapps/
WORKDIR /opt/tomcat/webapps
EXPOSE 8090
CMD ["catalina.sh", "run"]
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
