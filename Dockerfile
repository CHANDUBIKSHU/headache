FROM maven:3-eclipse-temurin-17 As build

COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-alpine

COPY --from=build /target/chandu-0.0.1-SNAPSHOT.jar chandubikshu.jar  
EXPOSE 8080
ENTRYPOINT ["java","-jar","chandubikshu.jar"]