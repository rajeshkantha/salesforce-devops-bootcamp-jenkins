pipeline {
    agent any

    // Define environment variables if needed
    /*environment {
        APP_NAME = 'SalesforceApp'
    }*/

    stages {
        stage('Checkout') {
            steps {
                echo 'Pulling code from Git...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Compiling and building the project...'
                // For Salesforce, this often involves validating source or installing dependencies
                //sh 'sf project deploy validate --dry-run --source-dir force-app' 
            }
        }

        stage('Test') {
            steps {
                echo 'Running unit tests...'
                // Example: Running Salesforce Apex tests
                //sh 'sf apex test run --result-format human --wait 10'
            }
        }
    }

    // Post-execution blocks for notifications and cleanup
    post {
        success {
            echo 'Pipeline completed successfully! Ready for deployment.'
            // You can add email or Slack notifications here
        }
        failure {
            echo 'Pipeline failed. Please check the console output for errors.'
            // Example: mail to: 'dev-team@example.com', subject: "Build Failed: ${env.JOB_NAME}"
        }
        always {
            echo 'Cleaning up workspace...'
            cleanWs()
        }
    }
}