#!groovy

pipeline {
    agent: any
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