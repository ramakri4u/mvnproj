FROM tomcat:8.0
USER root
WORKDIR /usr/local/tomcat/webapps/
RUN \
apt-get update && \
apt-get install unzip wget -y && \
rm -rf /var/lib/apt/lists/*

RUN wget -O /usr/local/tomcat/webapps/github-actions-artifact.zip https://pipelines.actions.githubusercontent.com/lNwizYUspxRDmD4Bvyg8rQ61LZIEFjJubnnJtETULdqKUeOUEY/_apis/pipelines/1/runs/17/signedartifactscontent?artifactName=github-actions-artifact&urlExpires=2021-07-26T06%3A43%3A41.5150020Z&urlSigningMethod=HMACV1&urlSignature=5R4YO1L0OB348i3wfQoR21B4%2BtK0FneGrzqYWc%2FntfI%3D \
&& unzip '/usr/local/tomcat/webapps/github-actions-artifact.zip' -d /usr/local/tomcat/webapps/ && rm /usr/local/tomcat/webapps/github-actions-artifact.zip || true;

ENV JAVA_HOME=/usr/bin/java
WORKDIR /usr/local/tomcat/webapps
USER  root
EXPOSE 8080
CMD ['./../bin/catalina.sh','run']

