pipeline {
    agent {
        node {
            label 'jenkins_node_default'
        }
    }
    triggers {
        pollSCM 'H/2 * * * *' // Polls Git every 2 minutes for new build
    }
    options {
        disableConcurrentBuilds() // Prevent overlapping builds
    }
    stages {
        stage('Build') {
            steps {
                echo "Building Branch_2..."
                sh '''
                cd myapp
                pip install -r requirements.txt
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing Branch_2..."
                sh '''
                cd myapp
                python3 Branch_2.py
                python3 Branch_2.py --name=Sai
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Delivering Branch_2...'
                sh '''
                echo "Branch_2 delivery logic..."
                '''
            }
        }
    }
}
