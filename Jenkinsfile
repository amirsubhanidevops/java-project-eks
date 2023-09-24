@Library('my-shared-library') _

pipeline {

    agent any

    parameters{
        choice(name:'action', choices: 'create\ndelete', description: 'choose create/Destroy')
    }

    stages{

        stage('Git checkout'){
        when{expresiion {params.action == 'create'}}
            steps{
                script{

                    gitCheckout(
                        branch: "main",
                        url: "https://github.com/amirsubhanidevops/java-project-eks.git"
                    )
                }
            }

        }

        stage('Unit test : Maven'){
        when{expresiion {params.action == 'create'}}

            steps{
                script{

                    unitTest()
                }
            }

        }

        stage('Integration test : Maven'){
        when{expresiion {params.action == 'create'}}
            steps{
                script{

                    integrationTest()
                }
            }

        }

        stage('Static code analysis : Sonar'){
        when{expresiion {params.action == 'create'}}
            steps{
                script{

                    staticCodeAnalysis()
                }
            }

        }
    }


}