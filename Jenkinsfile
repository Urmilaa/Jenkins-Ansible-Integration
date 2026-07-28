pipeline {    
    agent any    

    environment {
        IMAGE_NAME = "urmidevops/nginx-webpage"
        
    }

    stages {    

          stage('Checkout') {
            steps {
                    git branch: 'main', url: 'https://github.com/Urmilaa/Jenkins-Ansible-Integration'
               
            }
        }
        stage('Push Image to DockerHub') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {

                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push ${IMAGE_NAME}:latest
                    docker logout
                    '''
                }
            }
        }
        
        stage('Execute playbook') {           
            steps {          
                ansiblePlaybook(
                    credentialsId: 'JenkinAnsible',
                    disableHostKeyChecking: false,
                    installation: 'Ansible',
                    inventory: "${WORKSPACE}/Inventory.yaml",
                    playbook: "${WORKSPACE}/docker_deploy.yml",
                    vaultTmpPath: ''
                )
            }
        }    
    }
}
