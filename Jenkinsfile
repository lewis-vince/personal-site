pipeline {
    stages{
        stage('Clone from GitHub') {
            git 'https://github.com/lewis-vince/personal-site.git'
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