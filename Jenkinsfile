pipeline {
    agent any

    environment {
        NPM_CONFIG_CACHE = "${WORKSPACE}/.npm"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
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
        stage('Build Docker Image') {
            steps {
                // Use double quotes for variable interpolation
                sh "docker build -t my-react-app:${env.BUILD_NUMBER} ."
            }
        }
        stage('Deploy Application') {
            steps {
                sh 'docker rm -f my-react-app-container || true'
                // Use double quotes here as well
                sh "docker run -d -p 3000:3000 --name my-react-app-container my-react-app:${env.BUILD_NUMBER}"
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
