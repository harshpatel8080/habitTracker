
# Stage 1: Build with Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Deploy WAR to Tomcat
FROM tomcat:9.0-jdk17-corretto
COPY --from=build /app/target/HabitTracker-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/app.war

EXPOSE 8080


# FROM maven:3.9.6-eclipse-temurin-17 AS build
# # Set the working directory inside the container
# WORKDIR /app

# COPY pom.xml .

# COPY src ./src

# RUN mvn clean package -DskipTests

# WORKDIR /usr/local/tomcat/webapps/

# COPY /app/target/HabitTracker-0.0.1-SNAPSHOT.war app.war


# # Stage 2: Run with OpenJDK
# FROM eclipse-temurin:17-jdk-alpine

# EXPOSE 8080

# ENTRYPOINT ["java","-jar","app.war"]


 