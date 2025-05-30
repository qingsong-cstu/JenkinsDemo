pipeline {
    agent {
        node {
            label 'jenkins-agent-python'
        }
    }
    triggers {
        pollSCM('H/10 * * * *')
    }
    options {
        disableConcurrentBuilds()
    }
    stages {
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
                sh 'echo "Master Branch delivery logic..."'
            }
        }
    }
}
