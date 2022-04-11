FROM ubuntu:bionic

# Install additional tools (one layer is added for each instruction):
# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#minimize-the-number-of-layers
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y curl

# Download and unpack JRE: we use the Eclipse Adoptium JRE in this case
# (https://adoptium.net, previously known as AdoptOpenJDK).
WORKDIR /root
RUN curl -L https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.2%2B8/OpenJDK17U-jre_x64_linux_hotspot_17.0.2_8.tar.gz -o /root/jre.tar.gz
RUN tar zxfv /root/jre.tar.gz
RUN ln -s /root/jdk-17.0.2+8-jre /root/jre

# Copy app artifact into the container image.
COPY app/spring-on-k8s.jar /root

ENTRYPOINT [ "/root/jre/bin/java", "-jar", "/root/spring-on-k8s.jar" ]
