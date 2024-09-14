pipeline {
    agent any
     tools {
        nodejs 'NodeJS' // Make sure 'NodeJS' is configured in Jenkins under 'Global Tool Configuration'
    }
    options {
        // Timeout counter starts AFTER agent is allocated
        timeout(time: 1000, unit: 'SECONDS')
    }
    stages {
        stage('Example') {
            steps {
                echo 'Hello World'
            }   
        }
    }
}