# Use a recent Jenkins LTS version that supports required plugins
FROM jenkins/jenkins:2.452.1-jdk11

# Switch to root to install packages
USER root

# Install dependencies and Docker CLI
RUN apt-get update && \
    apt-get install -y \
        lsb-release \
        python3-pip \
        curl \
        gnupg2 \
        software-properties-common && \
    curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce-cli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the jenkins user
USER jenkins

# Install required Jenkins plugins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
