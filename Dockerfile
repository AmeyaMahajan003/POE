# Use a base image with JDK for compiling
FROM openjdk:11-jdk-slim AS build

# Copy the Java file
COPY HelloWorld.java /app/HelloWorld.java

# Set the working directory
WORKDIR /app

# Compile the Java program
RUN javac HelloWorld.java

# Use a minimal JRE image for running
FROM openjdk:11-jre-slim

# Copy the compiled class from the build stage
COPY --from=build /app/HelloWorld.class /app/HelloWorld.class

# Set the working directory
WORKDIR /app

# Run the application
ENTRYPOINT ["java", "HelloWorld"]
