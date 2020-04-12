FROM tomcat:9.0
RUN apt update && apt install -y maven
RUN wordkir /home && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN wordkir /home/boxfuse-sample-java-war-hello && mvn package
RUN wordkir /home/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps
EXPOSE 8080