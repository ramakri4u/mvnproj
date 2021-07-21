FROM tomcat:8.0
COPY /home/runner/work/mvnproj/mvnproj/target/myproj.war /usr/local/tomcat/webapps/
ENV JAVA_HOME=/usr/bin/java
WORKDIR /usr/local/tomcat/webapps
USER  root
EXPOSE 8080
CMD ['catalina.sh','run']
#/home/runner/work/mvnproj/mvnproj/target/myproj.war
