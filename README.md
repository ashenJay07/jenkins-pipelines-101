# Jenkins Pipelines 101

## Create Custom Jenkins Image

```sh
docker build -t custom/jenkins:lts -f Jenkins.Dockerfile .
```

## Start Jenkins Container

```sh
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --name jenkins-server custom/jenkins:lts
```

```sh
docker exec -it jenkins-server bash
```

## Get the initial admin password

```sh
docker exec jenkins-server cat /var/jenkins_home/secrets/initialAdminPassword
```

<br/>

## Mount Docker Daemon (Host machine daemon)

```sh
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v //var/run/docker.sock:/var/run/docker.sock --name jenkins-server custom/jenkins:lts
```

## Change socket file group

```sh
docker exec -it -u root jenkins-server /bin/bash
```

```sh
chown root:docker /var/run/docker.sock
```
