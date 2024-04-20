pipeline {
    agent any
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'main', description: '')
        string(name: 'IMAGE_NAME', defaultValue: '', description: '')
        string(name: 'CONTAINER_NAME', defaultValue: '', description: '')
        string(name: 'PORT_ON_DOCKER_HOST', defaultValue: '', description: '')
    }
    stages {
        stage('Clone Repository') {
            steps {
                script {
                    git credentialsId: 'jenkins-agents-node',
                        url: 'https://github.com/s8kevinaf02/python-web.git',
                        branch: "${params.BRANCH_NAME}"
                }
            }
        }
        stage('Checking the code') {
            steps {
                script {
                    sh """
                        ls -l
                    """ 
                }
            }
        }
        stage('Building the dockerfile') {
            steps {
                script {
                    sh """
                        docker build -t ${params.IMAGE_NAME} .
                        docker images |grep ${params.IMAGE_NAME}
                    """ 
                }
            }
        }
        stage('Deploying the application') {
            steps {
                script {
                    sh """
                        docker run -itd -p ${params.PORT_ON_DOCKER_HOST}:80 --name ${params.CONTAINER_NAME} ${params.IMAGE_NAME}
                        docker ps |grep ${params.CONTAINER_NAME}
                    """ 
                }
            }
        }
    }
}