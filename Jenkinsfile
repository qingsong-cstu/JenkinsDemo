pipeline {
    agent {
        node {
            label 'docker-agent-alpine'
        }
    }
    triggers {
        pollSCM('H/2 * * * *') // Polls Git every 2 minutes for new build
    }
    options {
        disableConcurrentBuilds() // Prevent overlapping builds
    }
    stages { 
        stage('Build') {
            steps {
                dir('myapp') {
                    sh '''
                    python3 -m venv venv
                    source venv/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                    '''
                }
            }
        }
        stage('Test') {
            steps {
                echo "Testing Master Branch..."
                sh '''
                cd myapp
                . venv/bin/activate
                python3 Branch_1.py
                python3 Branch_1.py --name=Sai
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Delivering Master Branch...'
                sh '''
                echo "Master Branch delivery logic..."
                '''
            }
        }
    }
}
