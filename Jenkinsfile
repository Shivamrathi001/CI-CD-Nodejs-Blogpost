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
                git 'https://github.com/Shivamrathi001/CI-CD-Nodejs-Blogpost.git' 
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
                    ls
                    pwd
                    zip -r blogpost.zip appspec.yml scripts
                    ls
                    aws s3 cp blogpost.zip s3://cicd-demo-jenkins/blogpost.zip
                    aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $registry
                    docker tag $dockerImage:$BUILD_NUMBER $registry/$dockerImage:latest
                    docker push $registry/$dockerImage:latest
                    aws deploy create-deployment --application-name "blogpost" --deployment-group-name 'blogpost-dev' --s3-location "bucket='cicd-demo-jenkins',key=blogpost.zip,bundleType=zip"
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

