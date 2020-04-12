FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
EXPOSE 8080
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package
 
FROM tomcat:9.0-jre8-alpine
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/hello-1.0.war $CATALINA_HOME/webapps/hello-1.0.war
 
HEALTHCHECK --interval=1m --timeout=3s CMD wget --quiet --tries=1 --spider http://localhost:8080/hello-1.0 || exit 1
