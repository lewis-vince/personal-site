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
            steps {
                echo 'Building image...'
                sh 'docker build -t $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO:$GIT_COMMIT .'
                // echo 'Tagging image...'
                // sh 'docker tag personal-site/personal-site:latest 014953256336.dkr.ecr.eu-west-2.amazonaws.com/personal-site:latest'
                echo 'Pushing image...'
                sh 'docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$PERSONAL_SITE_IMAGE_REPO:$GIT_COMMIT'
                echo 'Updating CloudFormation template...'
                sh 'aws cloudformation update-stack --stack-name $PERSONAL_SITE_STACK_NAME --use-previous-template --capabilities CAPABILITY_IAM \
                    --parameters ParameterKey=DockerImageURL,ParameterValue=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$PERSONAL_SITE_IMAGE_REPO:$GIT_COMMIT \
                    ParameterKey=DesiredCapacity,UsePreviousValue=true \
                    ParameterKey=InstanceType,UsePreviousValue=true \
                    ParameterKey=MaxSize,UsePreviousValue=true \
                    ParameterKey=SubnetIDs,UsePreviousValue=true \
                    ParameterKey=VpcId,UsePreviousValue=true'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}