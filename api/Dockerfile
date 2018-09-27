FROM openjdk:10-jre-slim
COPY ./target/api-1.0.jar /usr/productReview/api-1.0.jar
WORKDIR /usr/productReview
EXPOSE 8080
CMD ["java", "-jar", "api-1.0.jar"]