# Pull base image 
From tomcat:8-jre8 
#ADD ./webapp.war /usr/local/tomcat/webapps
COPY ./webapp.war /opt/tomcat/webapps
#RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
