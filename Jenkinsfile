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
                 export MINIKUBE_HOME=/var/lib/jenkins/.minikube
                 export KUBECONFIG=/var/lib/jenkins/.kube/config

                 sed -i "s|IMAGE_TAG|${BUILD_NUMBER}|g" deployemnt.yaml


                 kubectl get nodes

                 kubectl apply -f deployemnt.yaml
                 kubectl apply -f service.yaml
                 
                 sleep 10

                 kubectl get svc react-app-service
                 minikube ip
                 

                 '''
            }
        }
    }
}
