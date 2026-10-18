pipeline {
    agent any

    parameters {
        choice(name: 'ENVIRONMENT', choices: ['QA', 'Staging', 'Production'], description: 'Target deployment environment')
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build and Test') {
            steps {
                bat 'mvn clean test'
            }
        }

        stage('Package Application') {
            steps {
                bat 'mvn package -DskipTests'
            }
        }

        stage('Deploy to Server') {
            steps {
                echo "Deploying application to ${params.ENVIRONMENT} environment..."
                // Copy the built WAR file to Tomcat webapps directory
                // Adjust path based on your Tomcat installation location
                bat 'copy target\\commission-portal.war C:\\tomcat\\webapps\\commission-portal.war'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully! Application deployed.'
        }
        failure {
            echo 'Pipeline failed during execution.'
        }
    }
}