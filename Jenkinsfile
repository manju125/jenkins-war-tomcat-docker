pipeline {
    agent any
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/manju125/jenkins-war-tomcat-docker.git'
             
          }
        }
  stage('Execute Maven') {
           steps {
             
                sh 'sudo mvn clean package'             
          }
        }

 
stage('Docker Build and Tag') {
           steps {
              
                sh 'sudo docker build -t moni275/dockerintegration .' 
                //sh 'sudo docker tag samplewebapp moni275/dockerintegration:latest'
                //sh 'docker tag samplewebapp moni275/dockerintegration:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "Dockerhub", url: "https://hub.docker.com/repository/docker/moni275/dockerintegration" ]) {
          sh  'sudo docker push moni275/dockerintegration:latest'
        //  sh  'docker push moni275/dockerintegration:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
   {
                sh "sudo docker run -d -p 8003:8080 moni275/dockerintegration"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "sudo docker -H ssh://ec2-13-232-240-86.ap-south-1.compute.amazonaws.com run -d -p 8003:8080 moni275/dockerintegration"
 
            }
        }
    }
 }
