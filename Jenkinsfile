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
                 cp -r dist/* /var/www/react-app/
                 sudo systemctl reload nginx 
                 '''
            }
        }
    }
}
