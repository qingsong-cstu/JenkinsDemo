FROM jenkins/jenkins:lts-jdk17

# Install Docker CLI inside the Jenkins container (Debian base)
USER root
RUN apt-get update && apt-get install -y ca-certificates curl gnupg \
 && install -m 0755 -d /etc/apt/keyrings \
 && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
 && chmod a+r /etc/apt/keyrings/docker.gpg \
 && . /etc/os-release \
 && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $VERSION_CODENAME stable" >/etc/apt/sources.list.d/docker.list \
 && apt-get update && apt-get install -y docker-ce-cli \
 && rm -rf /var/lib/apt/lists/*

# (Optional) Set container timezone to PST/PDT
# RUN apt-get update && apt-get install -y tzdata && \
#     ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && \
#     dpkg-reconfigure -f noninteractive tzdata

USER jenkins

# Preinstall plugins (resolver will pick compatible versions for this LTS)
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

