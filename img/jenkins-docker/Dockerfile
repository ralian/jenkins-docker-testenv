ARG UPSTREAM=jenkins/jenkins:lts

FROM $UPSTREAM

ADD plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/plugins.txt

ADD jenkins_home /usr/share/jenkins/ref/
