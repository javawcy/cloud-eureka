FROM openjdk:8-jdk-alpine
ADD /target/*.jar app.jar
EXPOSE 8080
RUN echo "Asia/Shanghai" > /etc/timezone;
USER root
ARG EUREKA_PROFILE=server1
ENV EUREKA_PROFILE ${EUREKA_PROFILE}
CMD java -jar -Dspring.profiles.active=${EUREKA_PROFILE} -Xms125M -Xmx256M /app.jar