pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'jenkins/node-app:latest'
        CONTAINER_NAME = "simple-node-app"
        DOCKER_HUB_CREDENTIALS = 'dockerhub-credentials'
    }

    stages {
        // stage('Checkout') {
        //     steps {
        //         checkout scm
        //     }
        // }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Stop and Remove Previous Container') {
            steps {
                script {
                    sh """
                    if [ \$(docker ps -q -f name=${CONTAINER_NAME}) ]; then
                        docker stop ${CONTAINER_NAME}
                        docker rm ${CONTAINER_NAME}
                    fi
                    """
                }
            }
        }

        stage('Test Docker Image') {
            steps {
                // Run & test the docker container
                sh "docker run -d -p 5000:5000 --name ${CONTAINER_NAME} ${DOCKER_IMAGE}"
                sleep(5) // Allow container some time to start
                // sh "curl http://localhost:5000"
            }
        }

        stage('Push to DockerHub') {
            steps {
                echo "Pushing image to DockerHub..."
            }
        }
    }

    post {
        always {
            script {
                sh 'docker rm -f my-running-container || true'
            }
        }
    }
}