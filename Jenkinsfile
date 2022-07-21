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
                    credentialsId: "raviGitAccess",            
                    url: 'https://github.com/avbravikanth1/my-react-app.git'
                dir("kanth") {
                    git branch: 'main',
                    credentialsId: "raviGitAccess",
                    url: 'https://github.com/avbravikanth1/kanth.git'
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
                    inventory: 'kanth/inventories/dev.inv', 
                    limit: 'jenkinsserver', 
                    playbook: 'kanth/appDeploy.yml',
                    tags: 'clean_files,copy_files,chmod_operation'
            }
        }
        stage('EB Deployment') {
            steps {
                ansiblePlaybook become: true, 
                    credentialsId: 'JENKINS_APP_SERVER',
                    disableHostKeyChecking: true, 
                    installation: 'ansible', 
                    inventory: 'kanth/inventories/dev.inv', 
                    limit: 'jenkinsserver', 
                    playbook: 'kanth/appDeploy.yml',
                    tags: 'ebdeploy'                
            }
        }        
    }
}
