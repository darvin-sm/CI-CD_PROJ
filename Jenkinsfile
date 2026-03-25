pipeline {
    agent any



    tools {
        git 'git'       
    }

    stages {

        stage('checkout') {
            steps {
                checkout scm   
            }
        }

        stage('build-image') {
            steps {
                sh '''
                    docker build -t react-image:${BUILD_NUMBER} .
                '''
           }
        }
        stage('deploy container'){
            steps{
                sh '''
                 docker stop react-container || true
                 docker rm react-container || true
                 docker run -d -p 3000:80 --name react-container react-image:${BUILD_NUMBER} 
                 '''
            }
        }
    }
}
