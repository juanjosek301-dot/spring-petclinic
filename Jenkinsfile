    pipeline {
    agent none

    stages {
        stage('Maven Install') {
        agent {
            docker {
            image 'maven:3.9-eclipse-temurin-17'
            reuseNode true
            }
        }
        steps {
            sh 'mvn clean install'
        }
        }

        stage('Docker Build') {
        agent any
        steps {
            sh 'docker build -t TU_USUARIO_DOCKERHUB/spring-petclinic:gestion-udem-jenkins .'
        }
        }

        stage('Docker Push') {
        agent any
        steps {
            withCredentials([usernamePassword(
            credentialsId: 'dockerHub',
            usernameVariable: 'dockerHubUser',
            passwordVariable: 'dockerHubPassword'
            )]) {
            sh '''
                printf '%s' "$dockerHubPassword" | docker login --username "$dockerHubUser" --password-stdin
                docker push TU_USUARIO_DOCKERHUB/spring-petclinic:gestion-udem-jenkins
            '''
            }
        }
        }
    }
    }