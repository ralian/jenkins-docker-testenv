ARG UPSTREAM=jenkins/jenkins:lts

FROM $UPSTREAM

# Uncomment to enable local repo on the jenkins machine. This might be useful later.
#ENV JAVA_OPTS="-Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true"

ADD plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/plugins.txt

ADD jenkins_home /usr/share/jenkins/ref/

#COPY ca.pem /var/jenkins_home/.docker/certs/ca.pem
#COPY cert.pem /var/jenkins_home/.docker/certs/cert.pem
#COPY key.pem /var/jenkins_home/.docker/certs/cert.key

#ENV DOCKER_TLS_VERIFY=1
#ENV DOCKER_CERT_PATH=/var/jenkins_home/.docker/certs
