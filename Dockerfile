FROM eclipse-temurin:17-jre

WORKDIR /app

# Install curl for health checks
RUN apt-get update && apt-get install -y wget curl

# Download Lavalink
RUN wget -O Lavalink.jar "https://github.com/lavalink-devs/Lavalink/releases/download/4.0.0/Lavalink.jar"

# Copy config file
COPY application.yml .

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD curl -f http://localhost:8080/version || exit 1

# Start Lavalink
CMD ["java", "-jar", "Lavalink.jar"]
