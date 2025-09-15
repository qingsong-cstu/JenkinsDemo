FROM jenkins/jenkins:2.426.3-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release python3-pip \
    && curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
       https://download.docker.com/linux/debian/gpg \
    && echo "deb [arch=$(dpkg --print-architecture) \
       signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
       https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update && apt-get install -y docker-ce-cli \
    && rm -rf /var/lib/apt/lists/*
USER jenkins
RUN jenkins-plugin-cli --plugins blueocean docker-workflow
HEALTHCHECK --interval=30s --timeout=3s CMD curl --fail http://localhost:8080 || exit 1