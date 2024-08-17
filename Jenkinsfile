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
                sh 'mvn compile'
                }
            }

            }
stage('Test') {
    agent {label 'kdslave1'}
    when{
                expression{
                    params.RUN_STAGE_Test == true
                }
            }
            steps {
                script{
            echo "In-progress Test"
                sh 'mvn test'
                }
            }
}
stage('Install') {
    agent {label 'kdslave1'}
    when{
                expression{
                    params.RUN_STAGE_Install == true
                }
            }
            steps {
                script{
               echo "In-progress install"
                sh 'mvn install'
                }
                    }
                }
        }
}
