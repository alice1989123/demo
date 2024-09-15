pipeline {
    agent none // No global agent; agents are defined per stage

    stages {
        stage('Checkout') {
            agent any
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            agent {
                docker {
                    image 'node:20-alpine' // Use Node.js Docker image for this stage
                    args '-v /var/run/docker.sock:/var/run/docker.sock' // (Optional) If you need Docker commands inside the container
                }
            }
            environment {
                NPM_CONFIG_CACHE = "${WORKSPACE}/.npm" // Ensure npm cache is in a writable directory
            }
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            agent { docker { image 'node:20-alpine' } }
            steps {
                sh 'npm test'
            }
        }

        stage('Build Application') {
            agent { docker { image 'node:20-alpine' } }
            steps {
                sh 'npm run build'
            }
        }

        stage('Build Docker Image') {
            agent any // Run on Jenkins node where Docker is installed
            steps {
                sh "docker build -t my-react-app:${env.BUILD_NUMBER} ."
            }
        }

        stage('Deploy Application') {
            agent any
            steps {
                sh 'docker rm -f my-react-app-container || true'
                sh "docker run -d -p 3000:3000 --name my-react-app-container my-react-app:${env.BUILD_NUMBER}"
            }
        }
    }

    post {
    always {
        node('agent1') {
            cleanWs()

        }
    }
    }
}
