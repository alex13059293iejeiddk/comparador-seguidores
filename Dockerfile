# Usa una imagen oficial de Java 17 (o la versión que uses)
FROM eclipse-temurin:17-jdk-jammy

# Carpeta donde se colocará la app dentro del contenedor
WORKDIR /app

# Copia el archivo pom.xml y la carpeta src
COPY pom.xml .
COPY src ./src

# Descarga dependencias y empaqueta la app
RUN ./mvnw clean package -DskipTests

# Copia el archivo JAR generado al contenedor
COPY target/*.jar app.jar

# Comando para ejecutar la app
ENTRYPOINT ["java", "-jar", "app.jar"]

# Exponer puerto 8080 para la app
EXPOSE 8080

