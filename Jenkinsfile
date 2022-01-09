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
                sh 'sudo docker tag moni275/dockerintegration:latest  moni275/dockerintegration:$BUILD_NUMBER'
                //sh 'docker tag samplewebapp moni275/dockerintegration:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
                sh "docker login -u moni275 -p Manju@275"
                sh 'docker push moni275/dockerintegration:$BUILD_NUMBER'
        //withDockerRegistry([ credentialsId: "Dockerhub", url: "https://hub.docker.com/repository/docker/moni275/dockerintegration" ]) {
        //  sh  'sudo docker push moni275/dockerintegration:latest'
        //  sh  'docker push moni275/dockerintegration:$BUILD_NUMBER' 
      //  }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
   {
                sh "sudo docker run -d -p 80:80 moni275/dockerintegration"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "sudo docker -H ssh://ec2-3-110-128-0.ap-south-1.compute.amazonaws.com run -d -p 80:80 moni275/dockerintegration"
 
            }
        }
    }
 }
