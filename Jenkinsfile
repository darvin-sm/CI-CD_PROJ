pipeline {
    agent any

    tools {
        git 'git'       
        nodejs 'nodejs'
    }

    stages {

        stage('checkout') {
            steps {
                checkout scm   
            }
        }

        stage('build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('deploy'){
            steps{
                sh '''
                 rm -rf /var/www/react-app/*
                 cp -r build/* /var/www/react-app/
                 systemctl reload nginx 
                 '''
            }
        }
    }
}