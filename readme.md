# jenkins-docker-testenv

Windows prerequisites
- Docker Engine w/ WSL2 Backend
- For now, the daemon must be exposed on tcp://localhost:2375 w/o TLS

# Master Jenkins Image

To build and run,

```
docker build --tag jenkins-docker .
docker build -f workers/openjdk/Dockerfile --tag workers/openjdk .
docker run --rm -v ${PWD}/jobs:/var/jenkins_home/jobs -p 8080:8080 -it jenkins-docker
```

On linux replace `${PWD}` with `$(PWD)`.
