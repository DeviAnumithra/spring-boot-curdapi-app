# Use official OpenJDK image
FROM openjdk:17

# Port your Spring Boot app will run on
EXPOSE 8080

# Copy the JAR file into the container
ADD target/CRUDAPIexample-0.0.1-SNAPSHOT.jar app.jar

# Run the jar file
ENTRYPOINT ["java", "-jar", "/app.jar"]
