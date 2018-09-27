FROM openjdk:10-jre-slim
COPY ./target/processor-1.0.jar /usr/productReview/processor-1.0.jar
WORKDIR /usr/productReview
CMD ["java", "-jar", "processor-1.0.jar"]