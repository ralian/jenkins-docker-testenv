# jenkins-docker-testenv: Getting Started

## Windows (WSL2) - Minimum Docker Version: 18

The daemon must be exposed locally on port 2375 w/o TLS

```
docker build --tag jenkins-docker .
docker run --rm -v ${PWD}/jobs:/var/jenkins_home/jobs -p 8080:8080 -it jenkins-docker
```

## Linux - Minimum Docker Version: 20

First, add the following to your `/etc/docker/daemon.json` or `~/.config/docker/daemon.json`:

```
{
  "hosts": ["unix:///var/run/docker.sock", "tcp://127.0.0.1:2375"]
}
```
On some linux setups, you may need to disable a command switch conflict for the hosts (`-H fd://`) in the service config file. For Ubuntu 24.04 this is located at `/lib/systemd/system/docker.service`, just remove the `-H` flag entirely.

```
docker build --tag jenkins-docker .
docker run --rm -v $(pwd)/jobs:/var/jenkins_home/jobs --network=host -it jenkins-docker
```

# TLS Configuration (TODO)

In order to connect the docker container running jenkins on your client machine to other clouds, we need to do better than TCP without any encryption. There are several ways to do this, but I recommend setting up your own CA and creating your own x509 certs. This process is documented here: https://docs.docker.com/engine/security/protect-access/

This is also easier to do from Linux even if your client or server machines are Windows based.

Once you have the keys, set your config like so:

```
{
  "debug": false,
  "hosts": ["tcp://0.0.0.0:2376", "unix:///var/run/docker.sock"],
  "tlscacert": "/etc/docker/certs.d/ca.pem",
  "tlscert": "/etc/docker/certs.d/server.pem",
  "tlskey": "/etc/docker/certs.d/server.key",
  "tlsverify": true
}
```

You may also have to allow inbound docker subnet traffic past your firewall:

```
sudo iptables -A INPUT -p tcp -s 0.0.0.0/0 --dport 2376 -j ACCEPT
```

You can test this with `nmap -p 2376 <HOST> --reason`.
