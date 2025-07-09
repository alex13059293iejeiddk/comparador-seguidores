FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copiar archivos necesarios para build
COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn
COPY src ./src

# Dar permisos para ejecutar mvnw
RUN chmod +x mvnw

# Construir el proyecto y saltar tests
RUN ./mvnw clean package -DskipTests

# Copiar el jar construido
COPY target/comparador-seguidores-0.0.1-SNAPSHOT.jar app.jar

# Exponer puerto 8080
EXPOSE 8080

# Ejecutar la app
ENTRYPOINT ["java","-jar","/app/app.jar"]
