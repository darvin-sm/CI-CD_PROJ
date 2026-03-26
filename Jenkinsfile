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
                docker.withRegistry(['', docker_id]) {
                    def app = docker.build('darvinsm/react-image:${BUILD_NUMBER}')
                    app.push()

                }
           }
        }
        stage('deploy kube-container'){
            steps{
                sh '''
                 kubectl apply -f deployment.yaml
                 kubectl apply -f service.yaml
                 minikube service --url

                 '''
            }
        }
    }
}
