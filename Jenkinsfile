pipeline {
    agent any

    tools {
        // This name must match exactly the Name you gave in Global Tool Configuration
        nodejs 'Node 25'
    }
    
    environment {
        // Reference Jenkins Credentials IDs here
        SF_CONSUMER_KEY = credentials('SF_CONSUMER_KEY')
        SF_USERNAME     = 'rkantha-bootcamp@salesforce.com.devops'
        INSTANCE_URL    = 'https://login.salesforce.com' // or https://test.salesforce.com
        SERVER_KEY_FILE = credentials('SF_SERVER_KEY_FILE') 
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        /*stage('Install Salesforce CLI #') {
            steps {
                echo 'Installing Salesforce CLI'
                sh "npm install @salesforce/cli --global"
            }
        }*/

        stage('Authorize Salesforce Org') {
            steps {
                script {
                    // Authenticate using the JWT flow
                    echo 'Authenticate using the JWT flow............'
                    sh 'sf org login jwt --client-id ${SF_CONSUMER_KEY} --jwt-key-file ${SERVER_KEY_FILE} --username ${SF_USERNAME} --instance-url ${INSTANCE_URL} --set-default'
                    echo 'Authenticate successful.................' 
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    echo 'Running unit tests...'
                    // Optional: Run local tests before deploying
                    //sh "sf apex run test --wait 10 --result-format human"
                }
            }
        }

        stage('Deploy to Salesforce') {
            steps {
                script {
                    // Deploy source code. 
                    // Use --test-level RunLocalTests for Production or RunSpecifiedTests
                    echo 'Deploy source code............'
                    sh 'sf project deploy start --target-org ${SF_USERNAME} --wait 30'
                    echo 'Deploy source code completed............'
                }
            }
        }
    }

    post {
        always {
            echo 'Logging out Salesforce Org..........'
            //sh 'sf org logout --target-org ${SF_USERNAME} --no-prompt'
            echo 'Cleaning up the workspace...........'
            cleanWs()
        }
    }
}