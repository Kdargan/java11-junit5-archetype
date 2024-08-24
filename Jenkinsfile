pipeline {
    agent none
    tools {
        maven "mymvn"
    }
    parameters{
        booleanParam(name: 'Checkout_Feature_branch', defaultValue: true, description: 'If the stage has to execute or not')
        booleanParam(name: 'RUN_STAGE_Compile', defaultValue: true, description: 'If the stage has to execute or not')
        booleanParam(name: 'RUN_STAGE_Test', defaultValue: true, description: 'If the stage has to execute or not')
        booleanParam(name: 'RUN_STAGE_Install', defaultValue: true, description: 'If the stage has to execute or not')
    }
    environment{
        git_repo='https://github.com/Kdargan/java11-junit5-archetype.git'
        kdslave2='ec2-user@35.175.126.109'
        DEST_PATH='/home/ec2-user'
            }
    //properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '3'))])
    options {
        timeout(time: 180, unit: 'SECONDS')
    }

    stages {
        stage('Checkout Branch') {
            agent {label 'kdslave1'}
            
                when{
                expression{
                    params.Checkout_Feature_branch == true
                }
            }
            input {
                message "Select Branch"
                ok "Selected"
                parameters {
                    choice(name: 'Checkout branch', choices: ['feature1', 'feature2', 'feature3'], description: 'Checkout to branch')
                }
                }
            
            steps {
               echo "In-progress Checkout"
                git branch: 'feature1', url: "${git_repo}"
                
                }
                        }        
stage('Compile') {
    agent {label 'kdslave1'}
    when{
                expression{
                    params.RUN_STAGE_Compile == true
                }
            }
            steps {
                script{
               echo "In-progress Compile"
                sh 'mvn clean'    
                sh 'mvn compile'
                }
            }

            }
stage('Test') {
    agent any
    when{
                expression{
                    params.RUN_STAGE_Test == true
                }
            }
   
            steps {
                script{
                    sshagent(['Kdslave2']) {
            echo "In-progress Test"
            sh "scp -o StrictHostKeyChecking=no kdslave2_configfile.sh ${kdslave2}:${DEST_PATH}"
            sh "ssh -o StrictHostKeyChecking=no  ${kdslave2} 'bash ~/kdslave2_configfile.sh'"
                sh 'mvn test'
                }
            }
            }
}
stage('Install') {
    agent any
    when{
                expression{
                    params.RUN_STAGE_Install == true
                }
            }
            steps {
                script{
                    sshagent(['Kdslave2']) {
               echo "In-progress install"
                        input {
                message "Select Branch"
                ok "Selected"
                parameters {
                    choice(name: 'Checkout branch', choices: ['feature1', 'feature2', 'feature3'], description: 'Checkout to branch')
                }
                }
                sh 'mvn install'
                }
                    }
                }
}
        }
}
