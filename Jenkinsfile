pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t hello-java-app .'
            }
        }

        stage('Save Docker Image') {
            steps {
                sh 'docker save hello-java-app > hello-java-app.tar'
            }
        }

        stage('Copy Image to Prod') {
            steps {
                sh 'scp hello-java-app.tar m1@192.168.10.25:~/hello-prod/'
            }
        }

        stage('Deploy on Prod') {
            steps {
                sh '''
                ssh m1@192.168.10.25 "
                docker load < ~/hello-prod/hello-java-app.tar &&
                docker stop hello-java-app || true &&
                docker rm hello-java-app || true &&
                docker run -d --name hello-java-app hello-java-app
                "
                '''
            }
        }
    }
}
