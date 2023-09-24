@Library('my-shared-library') _

pipeline {
    agent any

    stages{

        stage('Git checkout'){

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

            steps{
                script{

                    unitTest()
                }
            }

        }

         stage('Integration test : Maven'){

            steps{
                script{

                    integrationTest()
                }
            }

        }
    }


}