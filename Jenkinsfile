pipeline {
    agent any

    // environment {
    //     AWS_ACCESS_KEY_ID = credentials('jenkins-aws-secret-key-id')
    //     AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-aceess-key')
    // }

    stages {
        stage("SCM Checkout") {
            steps {
                git branch: 'master',
                    credentialsId: "RajaGithubAccess",            
                    url: 'https://github.com/rajasekhar2304/my-react-app.git'
                dir("kanth") {
                    git branch: 'main',
                    credentialsId: "RajaGithubAccess",
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
                    credentialsId: 'JENKINS_APP_SERVER',
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
                    credentialsId: 'JENKINS_APP_SERVER',
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
