pipeline {    
    agent any    

    stages {    

          stage('Checkout') {
            steps {
                dir('AnsibleDemo') {
                    git branch: 'main', url: 'https://github.com/Urmilaa/Jenkins-Ansible-Integration'
                }
            }
        }

        stage('Execute playbook') {           
            steps {          
                ansiblePlaybook(
                    credentialsId: 'JenkinsAnsible',
                    disableHostKeyChecking: false,
                    installation: 'AnsibleDemo',
                    inventory: '/var/lib/jenkins/workspace/JenkinsAnsibleIntegration/AnsibleDemo/Inventory.yaml',
                    playbook: '/var/lib/jenkins/workspace/JenkinsAnsibleIntegration/AnsibleDemo/install_nginx_PB.yml',
                    vaultTmpPath: ''
                )
            }
        }    
    }
}
