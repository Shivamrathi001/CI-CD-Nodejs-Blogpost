pipeline { 
    environment { 
        registry = "548893471177.dkr.ecr.us-east-1.amazonaws.com" 
        // registryCredential = credentials('Dockerhub') 
        dockerImage = 'blogpost' 
        region = 'us-east-1'
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
                        docker build -t $dockerImage:$BUILD_NUMBER .
                    """
                }
           
        }
        stage('Deploy our image') { 
            steps { 
//                 withCredentials([usernamePassword(credentialsId: 'AWSCredentials', passwordVariable: 'Key', usernameVariable: 'User')]) {$class:'AmazonWebServicesCredentialsBinding',
                   withAWS(credentials: 'AWSCredentials'){
                    sh """ #!/bin/bash                  
                    aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $registry
                    docker tag $dockerImage:$BUILD_NUMBER $registry/$dockerImage:$BUILD_NUMBER
                    docker push $registry/$dockerImage:$BUILD_NUMBER
                    
                """
                }
                
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $dockerImage:$BUILD_NUMBER"
            }
        }
    }
}

