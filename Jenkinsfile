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
        stage('Deploy') {
            steps {
                echo 'Logging in to AWS...'
                sh '$(aws ecr get-login --no-include-email --region eu-west-2)'
                echo 'Building image...'
                sh 'docker build -t personal-site .'
                echo 'Tagging image...'
                sh 'docker tag personal-site:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$PERSONAL_SITE_IMAGE_REPO:latest'
                echo 'Pushing image...'
                sh 'docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$PERSONAL_SITE_IMAGE_REPO:latest'
                echo 'Updating CloudFormation template...'
                sh 'aws ecs update-service --cluster $AWS_ECS_CLUSTER_NAME --service $AWS_ECS_SERVICE_NAME --force-new-deployment'
            }
        }
    }
}