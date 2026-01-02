# ===== BUILD STAGE =====
FROM maven:3.8.6-eclipse-temurin-17-alpine AS build
WORKDIR /build
COPY pom.xml .
RUN mvn -B -q dependency:go-offline
COPY src ./src
RUN mvn -B -q clean package -DskipTests

# ===== RUNTIME STAGE =====
FROM eclipse-temurin:17-jre-alpine
ARG CONFIG_PORT=8888
ARG CONFIG_SERVER_URI
ARG CONFIG_SERVER_USERNAME
ARG CONFIG_SERVER_PASSWORD
ARG SPRING_PROFILES_ACTIVE=default

ENV SERVER_PORT=${CONFIG_PORT} \
    CONFIG_SERVER_URI=${CONFIG_SERVER_URI} \
    CONFIG_SERVER_USERNAME=${CONFIG_SERVER_USERNAME} \
    CONFIG_SERVER_PASSWORD=${CONFIG_SERVER_PASSWORD} \
    SPRING_PROFILES_ACTIVE=${SPRING_PROFILES_ACTIVE}

WORKDIR /app

COPY --from=build /build/target/*.jar app.jar

EXPOSE ${CONFIG_PORT}

ENTRYPOINT ["java", "-jar", "app.jar"]