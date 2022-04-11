# No need to install anything else: the base image has everything we need
# (a JRE in this case).
FROM eclipse-temurin:17-jre

# Just copy the app artifact into the container image.
COPY app/spring-on-k8s.jar /root

ENTRYPOINT [ "java", "-jar", "/root/spring-on-k8s.jar" ]
