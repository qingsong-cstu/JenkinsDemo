FROM jenkins/jenkins:2.414.2

USER root

# Install Docker CLI (optional, for docker-workflow to work properly)
RUN apt-get update && \
    apt-get install -y curl gnupg2 lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y docker-ce-cli

USER jenkins

# Copy plugin list into the container
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# Install plugins using plugin file (more reliable)
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
