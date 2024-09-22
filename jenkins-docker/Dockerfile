ARG UPSTREAM=jenkins/jenkins:lts

FROM $UPSTREAM

# Uncomment to enable local repo on the jenkins machine. This might be useful later.
#ENV JAVA_OPTS="-Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true"

ADD jenkins-docker/plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/plugins.txt

ADD . /usr/share/jenkins/ref/
WORKDIR /var/jenkins_home
