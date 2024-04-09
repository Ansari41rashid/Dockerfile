FROM ubuntu:22.04

#Install required package

RUN apt-get update && \
    apt-get install -y openjdk-11-jdk
RUN apt-get install -y net-tools

ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.87/bin/apache-tomcat-9.0.87.tar.gz /

RUN tar -xzf apache-tomcat-9.0.87.tar.gz
COPY Amazon/Amazon-Web/target/Amazon.war /apache-tomcat-9.0.87/webapps/
WORKDIR /apache-tomcat-9.0.87/bin

CMD ["catalina.sh", "run"]

EXPOSE 8080
