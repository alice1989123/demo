pipeline {
    agent {
        docker {    image 'node:20.17.0-alpine3.20'
                    args '-v /var/run/docker.sock:/var/run/docker.sock'  }
    }
    stages {
          stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
         stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
    }
}


