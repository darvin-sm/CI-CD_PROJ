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
                script {
                    
                docker.withRegistry('https://index.docker.io/v1/', 'docker_id') {

                    def app = docker.build("darvinsm/react-image:${BUILD_NUMBER}")
                    app.push()
                
                    }
                }      
           }
        }
        stage('deploy kube-container'){
            steps{
                sh '''
                 kubectl apply -f deployemnt.yaml
                 kubectl apply -f service.yaml
                 minikube service react-app-service --url

                 '''
            }
        }
    }
}
