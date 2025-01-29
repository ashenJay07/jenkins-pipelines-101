FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y docker.io \
    && apt-get clean

RUN getent group docker || groupadd docker && usermod -aG docker jenkins

EXPOSE 8080 50000