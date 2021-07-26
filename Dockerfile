FROM tomcat:8.0
cd /usr/local/tomcat/webapps/
RUN sudo apt-get install wget unzip -y
RUN wget https://pipelines.actions.githubusercontent.com/lNwizYUspxRDmD4Bvyg8rQ61LZIEFjJubnnJtETULdqKUeOUEY/_apis/pipelines/1/runs/17/signedartifactscontent?artifactName=github-actions-artifact&urlExpires=2021-07-26T06%3A43%3A41.5150020Z&urlSigningMethod=HMACV1&urlSignature=5R4YO1L0OB348i3wfQoR21B4%2BtK0FneGrzqYWc%2FntfI%3D
RUN unzip github-actions-artifact.zip /usr/local/tomcat/webapps/

#/home/runner/work/mvnproj/mvnproj/target/myproj.war
#COPY /home/runner/work/mvnproj/mvnproj/target/myproj.war /usr/local/tomcat/webapps/

ENV JAVA_HOME=/usr/bin/java
WORKDIR /usr/local/tomcat/webapps
USER  root
EXPOSE 8080
CMD ['catalina.sh','run']

