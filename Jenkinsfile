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
    //properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '3'))])
    options {
        timeout(time: 60, unit: 'SECONDS')
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
                git branch: 'feature1', url: 'https://github.com/Kdargan/java11-junit5-archetype.git'
                
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
            sh "scp -o StrictHostCheckingKey=no kdslave2_configfile.sh ec2-user@107.23.92.19:/root"
            sh "ssh -o StrictHostCheckingKey=no  ec2-user@107.23.92.19 'bash ~/kdslave2_configfile.sh'"
                        input {
                message "Select Branch"
                ok "Selected"
                parameters {
                    choice(name: 'Checkout branch', choices: ['feature1', 'feature2', 'feature3'], description: 'Checkout to branch')
                }
                }
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
                sh 'mvn install'
                }
                    }
                }
}
        }
}
