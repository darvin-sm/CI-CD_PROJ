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
    }
}