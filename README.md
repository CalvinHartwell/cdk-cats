# cdk-cats

To build the container, first install docker: 

```
sudo apt-get install docker-io
sudo docker build . -t cdk-cats
```

# Testing container on Docker

To test the container, run it in daemon mode: 

```
docker run -d -p 8080:80 cdk-cats
```

Then it should be running:

```
wget localhost:8080
```

# Deployng on k8s

```
cdk-cats-nodeport.yaml
```
