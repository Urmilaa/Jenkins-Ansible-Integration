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
                    inventory: '/home/ubuntu/Ansible-demo/Inventory.yaml',
                    playbook: '/home/ubuntu/Ansible-demo/install_nginx_PB.yml',
                    vaultTmpPath: ''
                )
            }
        }    
    }
}
