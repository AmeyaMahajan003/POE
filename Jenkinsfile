pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDENTIALS = 'dockerHubCredentials' // Jenkins credentials ID
        DOCKER_IMAGE = "your_dockerhub_username/hello-world"
    }
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/yourusername/hello-world.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} .'
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_HUB_CREDENTIALS}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    }
                    sh 'docker push ${DOCKER_IMAGE}:${BUILD_NUMBER}'
                }
            }
        }
    }
}
