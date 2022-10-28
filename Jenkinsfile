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
                    sh """ #!/bin/bash
                        docker build -t rathijaat001/blogpost:$BUILD_NUMBER .
                    """
                }
           
        }
        stage('Deploy our image') { 
            steps { 
//                 withCredentials([usernamePassword(credentialsId: 'AWSCredentials', passwordVariable: 'Key', usernameVariable: 'User')]) {$class:'AmazonWebServicesCredentialsBinding',
                   withAWS(credentials: 'AWSCredentials'){
                    sh """ #!/bin/bash
                    # docker login -u rathijaat001 -p $dockerKey
                    #docker tag rathijaat001/blogpost:$BUILD_NUMBER rathijaat001/blogpost:$BUILD_NUMBER
                    #docker push rathijaat001/blogpost:$BUILD_NUMBER
                    
                    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 548893471177.dkr.ecr.us-east-1.amazonaws.com
                    docker tag rathijaat001/blogpost:$BUILD_NUMBER 548893471177.dkr.ecr.us-east-1.amazonaws.com/blogpost:$BUILD_NUMBER
                    docker push 548893471177.dkr.ecr.us-east-1.amazonaws.com/blogpost:$BUILD_NUMBER
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

