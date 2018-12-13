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
                step('Install dependencies') {
                    sh 'npm install'
                }
                step('Build application') {
                    sh 'npm run build'
                }
            }
        }
        stage('Test') {
            sh 'npm test'
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