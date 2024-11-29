pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-node-test-image' // Name of the Docker image
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    docker.build("${env.DOCKER_IMAGE}")
                }
            }
        }

        stage('Run Unit Tests') {
            steps {
                script {
                    // Run tests inside the container
                    docker.image("${env.DOCKER_IMAGE}").inside {
                        sh 'npm test'
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean workspace
            cleanWs()
        }
        success {
            echo 'Tests passed successfully!'
        }
        failure {
            echo 'Tests failed. Check the logs for details.'
        }
    }
}
