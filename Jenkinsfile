#!groovy

pipeline {
    agent {
        docker {
            image 'node:latest'
        }
    }
    
    stages{
        stage('Install dependencies') {
            steps {
                sh 'sudo npm install'
            }
        }
        stage('Build application') {
            steps {
                sh 'sudo npm run build'
            }
        }
        stage('Run tests') {
            steps {
                sh 'sudo npm test'
            }
        }
        // stage('Publish docker image') {
            
        // }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}