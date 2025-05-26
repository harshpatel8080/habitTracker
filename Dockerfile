# Use OpenJDK base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

COPY pom.xml .

COPY src ./src

run mvn clean package -DskipTests

WORKDIR /usr/local/tomcat/webapps/

COPY /app/target/*.war app.war

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.war"]