pipeline {
    agent any 
    stages {
        stage("SCM Checkout") {
            steps {
                git branch: 'master',
                    credentialsId: "rajaGitAccess",            
                    url: 'https://github.com/rajasekhar2304/my-react-app.git'
                dir("test_iac") {
                    git branch: 'main',
                    credentialsId: "rajaGitAccess",
                    url: 'https://github.com/rajasekhar2304/test_iac.git'
            }
        }  
        }             
        stage('Build') {
            steps {
                sh "npm install"
                sh "npm run build"               
            }
        }
        stage('copy the files') {
            steps {
                ansiblePlaybook become: true,
                    credentialsId: 'eb-demo-jenkins',
                    disableHostKeyChecking: true, 
                    installation: 'ansible', 
                    inventory: 'test_iac/inventories/dev.inv', 
                    limit: 'jenkinsServer', 
                    playbook: 'test_iac/appDeploy.yml',
                    tags: 'clean_files,copy_files,chmod_operation'
            }
        }
        stage('EB Deployment') {
            steps {
                ansiblePlaybook become: true, 
                    credentialsId: 'eb-demo-jenkins',
                    disableHostKeyChecking: true, 
                    installation: 'ansible', 
                    inventory: 'test_iac/inventories/dev.inv', 
                    limit: 'jenkinsServer', 
                    playbook: 'test_iac/appDeploy.yml',
                    tags: 'ebdeploy'                
            }
        }        
    }
}
