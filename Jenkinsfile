pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "jenkins-node-docker"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE}:${env.BUILD_NUMBER} ."
            }
        }

        stage('Use Built Docker Image') {
            agent {
                docker {
                    image "${DOCKER_IMAGE}:${env.BUILD_NUMBER}"
                    args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            stages {
                stage('Install Dependencies') {
                    steps {
                        sh 'npm install'
                    }
                }
                stage('Run Tests') {
                    steps {
                        sh 'npm test'
                    }
                }
                stage('Build Application') {
                    steps {
                        sh 'npm run build'
                    }
                }
                // Additional stages as needed
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
