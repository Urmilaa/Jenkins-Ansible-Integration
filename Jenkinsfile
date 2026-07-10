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

         stage('Configure Jenkins SSH') {
            steps {
                sh '''
                sudo mkdir -p /var/lib/jenkins/.ssh

                sudo cp /home/ubuntu/.ssh/known_hosts /var/lib/jenkins/.ssh/

                sudo chown -R jenkins:jenkins /var/lib/jenkins/.ssh

                sudo chmod 700 /var/lib/jenkins/.ssh

                sudo chmod 600 /var/lib/jenkins/.ssh/known_hosts
                '''
            }
        }

        stage('Execute playbook') {           
            steps {          
                ansiblePlaybook(
                    credentialsId: 'JenkinAnsible',
                    disableHostKeyChecking: false,
                    installation: 'Ansible',
                    inventory: "${WORKSPACE}/AnsibleDemo/Inventory.yaml",
                    playbook: "${WORKSPACE}/AnsibleDemo/install_nginx_PB.yml",
                    vaultTmpPath: ''
                )
            }
        }    
    }
}
