ARG UPSTREAM=debian
FROM $UPSTREAM

# Note we could save about 100mb by using the JRE instead. Need to play around with settings.
RUN apt update; apt install -y git openjdk-17-jdk;
