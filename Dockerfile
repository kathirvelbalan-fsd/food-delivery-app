FROM tomcat:10.1-jdk17-openjdk-slim
RUN rm -rf /usr/local/tomcat/webapps/*
COPY COPY foodapp.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]