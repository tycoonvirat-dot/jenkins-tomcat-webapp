FROM tomcat:10

COPY target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080
