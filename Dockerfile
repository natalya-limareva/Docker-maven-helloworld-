FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y default-jdk
RUN apt-get install -y tomcat8
RUN apt-get install -y maven

WORKDIR /home/
RUN git clone https://github.com/kliakos/sparkjava-war-example.git
WORKDIR /home/sparkjava-war-example/
RUN pwd
RUN mvn package
RUN cp ./target/*.war /var/lib/tomcat8/webapps/
#RUN service tomcat8 restart

EXPOSE 80

CMD ["catalina.sh", "run"]