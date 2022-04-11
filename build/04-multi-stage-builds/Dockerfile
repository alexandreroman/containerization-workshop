# Create a container image in two steps:
# 1. build the app artifact using the Maven base image,
# 2. package the container image by copying the app artifact only
#    on top of a JRE base image.

# See this page for details on multi-stage builds:
# https://docs.docker.com/develop/develop-images/multistage-build/.

FROM maven:3.8-openjdk-17 AS builder

# Build the app artifact in this intermediate container image:
# you don't need to bring in the artifact, it'll be built using
# Docker and the tools available in this base image (Maven, JDK).
COPY app /build
WORKDIR /build
RUN mvn -DskipTests -B clean package

FROM eclipse-temurin:17-jre
VOLUME /tmp

RUN groupadd -g 1000 app && useradd -u 1000 -g app -ms /bin/bash app
WORKDIR /home/app

# Copy the app artifact stored in the "build" container.
COPY --from=builder /build/target/spring-on-k8s.jar /home/app
RUN chown -R app:app /home/app
USER app

ENTRYPOINT [ "java", "-jar", "/home/app/spring-on-k8s.jar" ]
