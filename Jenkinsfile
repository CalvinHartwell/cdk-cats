pipeline {
  agent any
  stages {
    stage('poll code') {
      steps {
        git(url: 'github.com/CalvinHartwell/cdk-cats', branch: 'master', poll: true)
      }
    }
    stage('deploy') {
      steps {
        sh '''# 
cd /tmp

# pull repo
git pull https://github.com/CalvinHartwell/cdk-cats.git

# build docker container
sudo docker build . -t="calvinhartwell/cdk-cats:latest"

# push the docker container 
sudo docker push  calvinhartwell/cdk-cats

# apply the deployment'''
      }
    }
  }
}