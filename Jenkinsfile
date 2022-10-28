node {
//     properties([
//     parameters([
//         choice(choices: ['dev', 'qa', 'stg', 'prod', 'destroy'], description: "Please Select env", name: "Environment"),
//         string(name: "BUCKET", defaultValue: "kips-all-wars", description: "bucketName"),
//         string(name: "REGION", defaultValue: "ap-south-1", description: "regionName"),
//         string(name: "WAR_NAME", defaultValue: "lti-service", description: "WarFileName")
//     ])
//     ])
    def docker = tool 'Docker'

    try {
        stage('Clone Repository') {
            git url: 'https://github.com/rathi001/blogpost.git', branch: 'master' 
            //checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Shivamrathi001/devops-webapp.git']]]
        }
        stage('Build') {
            app = docker.build("rathijaat001/blogpost")
        }
        stage('Deploy') {
             docker.withRegistry('https://registry.hub.docker.com', 'Dockerhub') {
              app.push("${env.BUILD_NUMBER}")
              app.push("latest")
          }
        }
    }

    finally{

        echo 'Stage is success'    

    }

}
