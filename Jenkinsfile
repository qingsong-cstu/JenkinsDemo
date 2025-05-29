pipeline {
    agent {
        node {
            label 'jenkins_node_default' // Your Jenkins agent label
        }
    }
    triggers {
        pollSCM 'H/2 * * * *' // Polls Git every 2 minutes
    }
    options {
        disableConcurrentBuilds() // Prevent overlapping builds
    }
    stages {
        stage('Build') {
            steps {
                echo "Building Branch_1..."
            }
        }
        stage('Test') {
            steps {
                echo "Testing Branch_1..."
                sh '''
                python3 Branch_1.py
                python3 Branch_1.py --name=Sai
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Delivering Branch_1...'
                sh '''
                echo "Branch_1 delivery logic..."
                '''
            }
        }
    }
}
