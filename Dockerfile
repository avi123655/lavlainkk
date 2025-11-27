FROM eclipse-temurin:17-jre

WORKDIR /app

RUN apt update && apt install -y wget

RUN wget -O Lavalink.jar "https://github.com/lavalink-devs/Lavalink/releases/download/4.0.0/Lavalink.jar"

COPY application.yml .

EXPOSE 8080

CMD ["java", "-jar", "Lavalink.jar"]
