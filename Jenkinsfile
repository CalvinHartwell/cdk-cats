pipeline {
  agent any
  stages {
    stage('poll code') {
      steps {
        git(url: 'https://github.com/CalvinHartwell/cdk-cats.git', branch: 'master', poll: true)
      }
    }
    stage('deploy') {
      steps {
        sh '''# Perform everything in tmp 
cd /tmp

# pull repo
git clone https://github.com/CalvinHartwell/cdk-cats.git
cd cdk-cats

# login to docker
docker login -u calvinhartwell -p Test123

# build docker container
sudo docker build . -t="calvinhartwell/cdk-cats:latest"

# push the docker container 
sudo docker push  calvinhartwell/cdk-cats

# apply the latest version to kubernetes
kubectl set image deploy/cdk-cats cdk-cats=calvinhartwell/cdk-cats:latest

# cleanup
cd /tmp
rm -rf /tmp/cdk-cats'''
      }
    }
  }
}