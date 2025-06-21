pipeline {
	agent any

    environment {
		DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id') // Add this in Jenkins > Credentials
        IMAGE_NAME = 'devi/spring-boot-curdapi-app'
    }

    stages {
		stage('Clone Repo') {
			steps {
				git 'https://github.com/DeviAnumithra/spring-boot-curdapi-app.git'
            }
        }

        stage('Build App') {
			steps {
				sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
			steps {
				script {
					docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push to Docker Hub') {
			steps {
				script {
					docker.withRegistry('', 'dockerhub-credentials-id') {
						docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }

        stage('Deploy to Dev') {
			steps {
				sh """
                docker rm -f springboot-container || true
                docker run -d -p 8080:8080 --name springboot-container ${IMAGE_NAME}:latest
                """
            }
        }
    }
}
