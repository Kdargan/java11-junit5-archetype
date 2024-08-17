pipeline {
    agent any
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
        stage('Checkout Master') {
            when{
                expression{
                    params.Checkout_Feature_branch == true
                }
            }
            
            steps {
               echo "In-progress Checkout"
                }
                        }        
stage('Compile') {
    when{
                expression{
                    params.RUN_STAGE_Compile == true
                }
            }
            steps {
               echo "In-progress Compile"
                sh 'mvn compile'
            }

            }
stage('Test') {
    when{
                expression{
                    params.RUN_STAGE_Test == true
                }
            }
            steps {
            echo "In-progress Test"
                sh 'mvn test'
            }
}
stage('Install') {
    when{
                expression{
                    params.RUN_STAGE_Install == true
                }
            }
            steps {
               echo "In-progress install"
                sh 'mvn install'
                    }
                }
        }
}
