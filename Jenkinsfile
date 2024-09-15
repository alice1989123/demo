pipeline {
    agent any

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
                sh 'docker build -t my-react-app .'
            }
        }
        stage('Deploy Application') {
            steps {
                sh 'docker rm -f my-react-app-container || true'
                sh 'docker run -d -p 3000:3000 --name my-react-app-container my-react-app'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
