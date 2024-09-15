pipeline {
    agent {
        docker {
            image 'node:20.17.0-alpine3.20'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    environment {
        NPM_CONFIG_CACHE = '.npm'
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
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t my-react-app .'
                }
            }
        }
        stage('Deploy Application') {
            steps {
                script {
                    // Stop the existing container if it exists
                    sh 'docker rm -f my-react-app-container || true'

                    // Run the new container in detached mode
                    sh 'docker run -d -p 3000:3000 --name my-react-app-container my-react-app'
                }
            }
        }
    }
}
