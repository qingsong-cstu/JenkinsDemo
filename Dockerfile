FROM jenkins/jenkins:2.452.1-jdk11

USER root

# Install Docker CLI (optional for docker-workflow)
RUN apt-get update && \
    apt-get install -y curl gnupg2 lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y docker-ce-cli

USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
