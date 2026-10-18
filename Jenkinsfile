pipeline {
    agent any

    parameters {
        choice(name: 'DEPLOY_ENV', choices: ['Staging', 'Production'], description: 'Target deployment environment')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Compile Code') {
            steps {
                bat 'mvn clean compile'
            }
        }

        stage('Run Selenium Tests') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Package Artifact') {
            steps {
                bat 'mvn package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t commission-portal:v1.0.0 .'
            }
        }

        stage('Deploy Docker Container') {
            steps {
                echo "Deploying container to ${params.DEPLOY_ENV} environment..."
                // Stop and remove existing container if running (ignore errors if not running)
                bat 'docker stop commission-container || exit /b 0'
                bat 'docker rm commission-container || exit /b 0'
                
                // Run new container mapped to port 8085
                bat 'docker run -d -p 8085:8080 --name commission-container commission-portal:v1.0.0'
            }
        }
    }

    post {
        always {
            junit 'target/surefire-reports/*.xml'
        }
        success {
            echo 'Pipeline completed successfully! Docker container is live.'
            archiveArtifacts artifacts: 'target/*.war', fingerprint: true
        }
        failure {
            echo 'Pipeline failed! Check build logs or test results.'
        }
    }
}