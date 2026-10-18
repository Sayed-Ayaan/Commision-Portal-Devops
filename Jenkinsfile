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

        stage('Build & Test') {
            steps {
                bat 'mvn clean compile'
            }
        }

        stage('Package Artifact') {
            steps {
                bat 'mvn package -DskipTests'
            }
        }

        stage('Deploy to Server') {
            steps {
                echo "Deploying application to ${params.DEPLOY_ENV} environment..."
                // Using quotes around paths with spaces and wildcard for WAR file
                bat 'copy target\\*.war "C:\\Program Files\\Apache Software Foundation\\Tomcat 10.1\\webapps\\commission-portal.war"'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
            archiveArtifacts artifacts: 'target/*.war', fingerprint: true
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}