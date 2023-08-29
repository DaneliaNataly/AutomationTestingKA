pipeline {
    agent {
        label 'master'
    }
    environment {
        envString = 'true'
    }
    post {
        always {
            bat "echo always"
            allure includeProperties: false, jdk: '', results: [[path: 'build/vanessa/allure']]         
            junit allowEmptyResults: true, testResults: 'build/vanessa/junit/*.xml'
        }
        failure {
            bat "echo failure"
        }
        success {
            bat "echo success"
        }
    }
    stages {
       
        stage("vanessa") {
            steps {
                script {
                  //  try {
                        bat """chcp 65001
                        //call vrunner compileepf features/step_definitions features/step_definitions 
                        call vrunner vanessa"""
                   // }  catch(Exception Exc) {
                       // currentBuild.result = 'UNSTABLE'
                    //}
                }
            }
        }
     
    }
}