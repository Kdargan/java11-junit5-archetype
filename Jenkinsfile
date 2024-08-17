pipeline {
    agent any
    tools {
        maven "mymvn"
    }
    parameters{
        booleanParam(name: 'RUN_STAGE', defaultValue: true, description: 'If the stage has to execute or not')
    }

    stages {
        stage('Checkout Master') {
            when{
                expression{
                    params.RUN_STAGE == true
                }
            }
            
            steps {
               echo "Print Checkout"
                }
                        }        
stage('Compile') {
    when{
                expression{
                    params.RUN_STAGE == true
                }
            }
            steps {
               echo "Print Compile"
            }

            }
stage('Test') {
    when{
                expression{
                    params.RUN_STAGE == true
                }
            }
            steps {
            echo "Print Test"
            }
}
stage('Install') {
    when{
                expression{
                    params.RUN_STAGE == true
                }
            }
            steps {
               echo "Print install"
                    }
                }
        }
}
