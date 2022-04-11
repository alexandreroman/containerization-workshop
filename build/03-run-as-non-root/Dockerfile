FROM eclipse-temurin:17-jre

# You better add this instruction when using a non-root user.
VOLUME /tmp

# Create a dedicated user for running the app in the container image.
RUN groupadd -g 1000 app && useradd -u 1000 -g app -ms /bin/bash app

# Copy the app artifact and change ownership.
COPY app/spring-on-k8s.jar /home/app
RUN chown -R app:app /home/app

# Switch to the dedicated user and drop root privileges.
USER app
WORKDIR /home/app

ENTRYPOINT [ "java", "-jar", "/home/app/spring-on-k8s.jar" ]
