
FROM maven:3.8.5-openjdk-11 AS maven_build

COPY pom.xml /tmp/

COPY kubernetes /tmp/src/

WORKDIR /tmp/

RUN mvn package

FROM openjdk

COPY --from=maven_build /tmp/target/kubernetes-1.0.jar /data/kubernetes-1.0.jar

EXPOSE 8080

CMD java -jar /data/kubernetes-1.0.war
