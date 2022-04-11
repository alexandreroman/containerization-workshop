FROM maven:3.8-openjdk-17 AS builder

COPY app /build
WORKDIR /build
RUN mvn -DskipTests=true -B clean package

# Not only we build an app artifact in a "build" container image,
# but we also optimize the app for container usage by exploding
# the JAR file using a Spring Boot built-in tool:
# https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#container-images.dockerfiles.
RUN java -Djarmode=layertools -jar target/spring-on-k8s.jar extract

FROM eclipse-temurin:17-jre
VOLUME /tmp

RUN groupadd -g 1000 app && useradd -u 1000 -g app -ms /bin/bash app
WORKDIR /home/app

# When running a Java app in a container, an exploded JAR file
# is better for app performance: no need to extract embedded dependencies
# since those files are already available in the filesystem.
COPY --from=builder /build/dependencies/ ./
COPY --from=builder /build/spring-boot-loader/ ./
COPY --from=builder /build/snapshot-dependencies/ ./
COPY --from=builder /build/application/ ./

RUN chown -R app:app /home/app
USER app

# Note the use of JarLauncher: a Spring Boot launcher which is responsible
# for setting up classpath and locating the main class from the app.
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]
