pipeline {
    agent { 
        node {
            label 'docker-agent-python-branch1' // Unique label
        }
    }
    triggers {
        pollSCM 'H/2 * * * *' // Less frequent polling
    }
    options {
        disableConcurrentBuilds() // Prevent queue flooding
    }
    stages {
        stage('Build') {
            steps {
                echo "Building Branch_1..."
                sh '''
                cd myapp
                pip install -r requirements.txt
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing Branch_1..."
                sh '''
                cd myapp
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
