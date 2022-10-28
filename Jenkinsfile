pipeline { 
    environment { 
        registry = "rathijaat001/blogpost" 
        // registryCredential = credentials('Dockerhub') 
        dockerImage = 'blogpost' 
    }
    agent any 
    stages { 
        stage('Cloning our Git') { 
            steps { 
                git 'https://github.com/rathi001/blogpost.git' 
            }
        } 
        stage('Building our image') { 
            steps {
                // script { 
                //     // dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                    sh """ #!/bin/bash
                        docker build -t rathijaat001/blogpost:$BUILD_NUMBER .
                    """
                }
            // } 
        }
        stage('Deploy our image') { 
            steps { 
                // script { 
                //     docker.withRegistry( '', registryCredential ) { 
                //         dockerImage.push() 
                //     }
                // } 
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', passwordVariable: 'dockerKey', usernameVariable: 'dockerUser')]) {
                    sh """ #!/bin/bash
                    docker login -u rathijaat001 -p $dockerKey
                    docker tag rathijaat001/blogpost:$BUILD_NUMBER rathijaat001/blogpost:$BUILD_NUMBER
                    docker push rathijaat001/blogpost:$BUILD_NUMBER
                """
                }
                
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}

