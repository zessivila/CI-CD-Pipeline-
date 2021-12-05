pipeline {
    agent any
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'main', url: 'git@github.com:zessivila/CI-CD-using-Docker.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp zali45591/samplewebapp:latest'
                //sh 'docker tag samplewebapp zali45591/samplewebapp:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push zali45591/samplewebapp:latest'
        //  sh  'docker push zali45591/samplewebapp:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8003:8080 zali45591/samplewebapp"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@172.31.95.24  run -d -p 8003:8080 zali45591/samplewebapp"
 
            }
        }
    }
	}
