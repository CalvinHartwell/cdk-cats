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
        sh '''# Determine user used by jenkins for debugging
whoami
groups

# Perform everything in tmp, clean up from failed jobs
cd /tmp
rm -rf /tmp/cdk-cats

# pull repo
git clone https://github.com/CalvinHartwell/cdk-cats.git
cd cdk-cats

# login to docker
docker login -u calvinhartwell -p Test123

# build docker container
docker build . -t="calvinhartwell/cdk-cats:latest"

# push the docker container 
docker push  calvinhartwell/cdk-cats

# apply the latest version to kubernetes
kubectl set image deployment/cdk-cats cdk-cats=calvinhartwell/cdk-cats'''
      }
    }
  }
}