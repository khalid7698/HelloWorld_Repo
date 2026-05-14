pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t hello-java-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run --rm hello-java-app'
            }
        }
    }
}
