#!groovy

pipeline {
    agent {
        docker {
            image 'node:latest'
        }
    }
    
    stages{
        stage('Clone from GitHub') {
            git 'https://github.com/lewis-vince/personal-site.git'
        }
        stage('Install dependencies') {
            sh 'npm install'
        }
        step('Build application') {
            sh 'npm run build'
        }
        stage('Run tests') {
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