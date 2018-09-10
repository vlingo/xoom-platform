FROM maven:alpine as build

RUN mkdir /application
WORKDIR /application
COPY pom.xml .
RUN mvn install
COPY . .
RUN mvn package

FROM openjdk:alpine
COPY --from=build /application/target/*.jar ./

EXPOSE 8082
CMD ["java", "-jar", "<generated-artifact-name>.jar"]
