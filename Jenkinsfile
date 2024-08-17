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
            When {
                expression{
                    params.RUN_STAGE == true
                }
            }
            
            steps {
               echo "Print Checkout"
                }
                        }        
stage('Compile') {
    When {
                expression{
                    params.RUN_STAGE == true
                }
            }
            steps {
               echo "Print Compile"
            }

            }
stage('Test') {
    When {
                expression{
                    params.RUN_STAGE == true
                }
            }
            steps {
            echo "Print Test"
            }
}
stage('Install') {
    When {
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
