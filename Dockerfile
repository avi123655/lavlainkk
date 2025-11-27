FROM openjdk:17-alpine

WORKDIR /app

# Download Lavalink
RUN wget -O Lavalink.jar "https://github.com/lavalink-devs/Lavalink/releases/download/4.0.0/Lavalink.jar"

# Copy config file
COPY application.yml .

# Expose port
EXPOSE 8080

# Start Lavalink
CMD ["java", "-jar", "Lavalink.jar"]
