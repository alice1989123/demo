pipeline {
    agent {
        docker {
            image 'node:20.17.0-alpine3.20' // Use a Node.js Docker image for the build
            args '-v /var/run/docker.sock:/var/run/docker.sock' // Allow Docker commands within the container
        }
    }
    environment {
        NPM_CONFIG_CACHE = '.npm' // Set npm cache directory to a writable location
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from the repository
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                // Install npm dependencies
                sh 'npm install'
            }
        }
        stage('Run Tests') {
            steps {
                // Run tests
                sh 'npm test'
            }
        }
        stage('Build Application') {
            steps {
                // Build the application
                sh 'npm run build'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build a Docker image
                    sh 'docker build -t my-react-app .'
                }
            }
        }
        stage('Deploy Application') {
            steps {
                script {
                    // Stop any running container with the same name
                    sh 'docker rm -f my-react-app-container || true'

                    // Run a new Docker container with the built image
                    sh 'docker run -d -p 3000:3000 --name my-react-app-container my-react-app'
                }
            }
        }
    }
    post {
        always {
            // Clean up workspace after build
            cleanWs()
        }
    }
}
