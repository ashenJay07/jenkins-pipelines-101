pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'jenkins/node-app:latest'
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

        stage('Test Docker Image') {
            steps {
                // Run & test the docker container
                sh "docker run -d -p 5000:5000 ${DOCKER_IMAGE}"
                sleep(5) // Allow container some time to start
                sh "curl http://localhost:5000"
            }
        }

        stage('Push to DockerHub') {
            steps {
                echo "Pushing image to DockerHub..."
            }
        }
    }

}