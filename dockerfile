# --- Stage 1: Build the application ---
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy the build file and source code
COPY pom.xml .
COPY src ./src

# Package the application (skip tests for faster pipeline execution if managed separately in Jenkins)
RUN mvn clean package -DskipTests

# --- Stage 2: Create the final lightweight runtime image ---
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copy the compiled JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the default Spring Boot port
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
