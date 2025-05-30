pipeline {
    agent {
        node {
            label 'docker-agent-python'
        }
    }
    triggers {
        pollSCM('H/10 * * * *') // Polls Git every 10 minutes for new build
    }
    options {
        disableConcurrentBuilds() // Prevent overlapping builds
    }
    stages {  
        stage('Prepare Python') {
            steps {
                sh '''
                apk update
                apk add --no-cache python3 py3-pip python3-venv
                python3 -m ensurepip
                pip3 install --upgrade pip
                '''
            }
        }
        stage('Build') {
            steps {
                dir('myapp') {
                    sh '''
                    python3 -m venv venv
                    . venv/bin/activate
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
                python3 hello.py
                python3 hello.py --name=Sai
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
