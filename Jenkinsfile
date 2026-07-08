pipeline {
    agent any 

    stages{
        stage{
            setps(''){
                checkout scm
            }
        }
        stage ('Build Docker file'){
            sh 'docker build -t practise'
        }

        stage('Stop old container'){
            sh  '''
            docker stop practise || true
            docker rm practise || true
            '''
        }

        stage('Run Docker Container'){
            sh '''
            docker run -d --name practise -p 5173:5173 practise
            '''
        }

        stage('Check status'){
            echo 'Container run successfull'
            sh 'docker ps'
        }
    }

    post{
        success {
            echo 'Application deployed successfully!'
        }

        failure {
            echo 'Deployment failed!'
        }
    }
}