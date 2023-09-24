@Library('my-shared-library') _

pipeline {

    agent any

    parameters{
        choice(name:'action', choices: 'create\ndelete', description: 'choose create/Destroy')
        string(name: 'ImageName', description:"name of the docker build", defaultValue: 'javapp')
        string(name: 'ImageTag', description:"tag of the docker build", defaultValue: 'v1')
        string(name: 'DockerHubUser', description:"name of the application", defaultValue: 'amirsubhani')
    }

    stages{

        stage('Git checkout'){
          when{expression {params.action == 'create'}}
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
          when{expression {params.action == 'create'}}

            steps{
                script{

                    unitTest()
                }
            }

        }

        stage('Integration test : Maven'){
          when{expression {params.action == 'create'}}
            steps{
                script{

                    integrationTest()
                }
            }

        }

        stage('Static code analysis : Sonar'){
          when{expression {params.action == 'create'}}
            steps{
                script{

                    def SonarqubecredentialsId = 'sonarqube-api'
                    staticCodeAnalysis(SonarqubecredentialsId)

                }
            }

        }

        stage('Code Quality gate status check : Sonarqube'){
          when{expression {params.action == 'create'}}
            steps{
                script{

                def SonarqubecredentialsId = 'sonarqube-api'
                staticCodeAnalysis(SonarqubecredentialsId)
                }
            }

        }

        stage('MVN Build: Maven'){
          when{expression {params.action == 'create'}}
            steps{
                script{

                    mavenBuild()
                }
            }

        }

         stage('Docker Image Build: Docker'){
          when{expression {params.action == 'create'}}
            steps{
                script{

                    dockerBuild("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
                }
            }

        }


    }


}