FROM openjdk:8-jdk as builder
WORKDIR /home/realworld/app
COPY . /home/realworld/app
RUN ./gradlew bootJar

FROM openjdk:8-jre
EXPOSE 8080
WORKDIR /home/realworld/app
COPY --from=0 /home/realworld/app/build/libs/spring-boot-realworld-example-app-0.0.1-SNAPSHOT.jar .
ENTRYPOINT java -jar spring-boot-realworld-example-app-0.0.1-SNAPSHOT.jar

