
FROM maven:3.9.6-eclipse-temurin-17 AS build
# Set the working directory inside the container
WORKDIR /app

COPY pom.xml .

COPY src ./src

RUN mvn clean package -DskipTests

WORKDIR /usr/local/tomcat/webapps/

COPY /app/target/*.war app.war


# Stage 2: Run with OpenJDK
FROM eclipse-temurin:17-jdk-alpine

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.war"]


 