pipeline {
    agent any
    tools {
        nodejs 'NodeJS' // Ensure 'NodeJS' is configured in Jenkins under 'Global Tool Configuration'
    }
    options {
        // Set a timeout to avoid long-running jobs
        timeout(time: 1000, unit: 'SECONDS')
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                git branch: 'main', url: 'https://github.com/alice1989123/demo.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                // Install dependencies
                sh 'npm install'
            }
        }
        stage('Build') {
            steps {
                // Build the React project
                sh 'npm run build'
            }
        }
    }
    post {
        success {
            echo 'Build completed successfully.'
        }
        failure {
            echo 'Build failed.'
        }
    }
}
