#base image
FROM tomcat:10.0.0-jdk11-openjdk-buster
#set environment variables
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_VERSION 3.8.8
#Since we are using Ubuntu container for Centos Host OS.
#Hence update apt-get package installer for Ubuntu & install Curl.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && apt-get update 
RUN apt-get install -y curl
RUN apt install maven
#Using curl donload maven setup.Setup file is zip file hence using tar xzf command to unzip setup.
#AND copy setup to /usr/share path.
RUN curl -fsSL https://dlcdn.apache.org/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz | tar xzf - -C /usr/share
#move the setup to maven dir.
RUN mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven
#clean the resources and clear lists.
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/*

WORKDIR /app
#copy ./src folder from the host to the ./src in the container.
COPY ./src ./src
COPY ./pom.xml ./pom.xml
#run this command to create .war file in the target folder.
RUN mvn package
#delete all the files in the webapps folder.
RUN rm -rf /usr/local/tomcat/webapps/*
#copy .war file from target folder to webapps folder
RUN cp /app/target/java11-junit5-archetype.war /usr/local/tomcat/webapps/
#assign port to run your application the container.
EXPOSE 8080
#run tomcat binary file to run application on web-server
CMD ["cataline.sh", "run"]



