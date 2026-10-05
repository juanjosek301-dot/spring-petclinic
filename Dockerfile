FROM eclipse-temurin:17-jre-alpine
LABEL maintainer="jcano211@soyudemedellin.edu.co"
COPY target/*.jar /home/spring-petclinic.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/home/spring-petclinic.jar"]