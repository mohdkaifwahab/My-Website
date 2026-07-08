pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t practise .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                    docker stop practise || true
                    docker rm practise || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                    docker run -d --name practise -p 5173:5173 practise
                '''
            }
        }

        stage('Check Status') {
            steps {
                echo 'Container running successfully'
                sh 'docker ps'
            }
        }
    }

    post {
        success {
            echo 'Application deployed successfully!'
        }

        failure {
            echo 'Deployment failed!!'
        }
    }
}