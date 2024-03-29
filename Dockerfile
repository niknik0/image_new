

FROM maven:3.5.4-jdk-8 AS build

RUN mvn -f /var/lib/jenkins/workspace/Docker/pom.xml clean package

FROM openjdk:8
COPY --from=build /usr/src/app/target/flighttracker-1.0.0-SNAPSHOT.jar /usr/app/flighttracker-1.0.0-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/flighttracker-1.0.0-SNAPSHOT.jar"]