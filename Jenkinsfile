#!groovy

pipeline {
    agent any
    tools {nodejs "node"}

    stages{
        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Build application') {
            steps {
                sh 'npm run build'
            }
        }
        // stage('Run tests') {
        //     steps {
        //         sh 'npm test'
        //         sh 'a'
        //     }
        // }
        stage('Publish docker image') {
            
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}