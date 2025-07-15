FROM jenkins/jenkins:2.414.2-jdk11

USER root

RUN apt-get update && apt-get install -y \
  lsb-release python3-pip curl gnupg apt-transport-https ca-certificates && \
  curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
    https://download.docker.com/linux/debian/gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    > /etc/apt/sources.list.d/docker.list && \
  apt-get update && apt-get install -y docker-ce-cli && \
  apt-get clean

USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
