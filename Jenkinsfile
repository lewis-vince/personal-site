#!groovy

pipeline {
    agent {
        docker {
            image 'node:latest'
        }
    }
    
    stages{
        stage('Clone from GitHub') {
            steps {
                git 'https://github.com/lewis-vince/personal-site.git'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
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