FROM maven:3-eclipse-temurin-17 As build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-alpine
WORKDIR /app
COPY --from=build /target/*.jar app.jar  
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]