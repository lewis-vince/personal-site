#!groovy

pipeline {
    agent {
        docker {
            image 'node:6.3'
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
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}