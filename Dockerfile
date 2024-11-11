# Use an official base image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy application JAR file to the container
COPY target/myapp.jar /app/myapp.jar

# Run the application
CMD ["java", "-jar", "/app/myapp.jar"]
