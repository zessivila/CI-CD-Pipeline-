node{
     
    stage('SCM Checkout'){
        git url: 'https://github.com/zessivila/CI-CD-Pipeline-.git',branch: 'main'
    }
    
    stage(" Maven Clean Package"){
      def mavenHome =  tool name: "Maven", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
       sh "${mavenCMD} clean package"
      
    } 
    
    
    stage('Build Docker Image'){
        sh 'docker build -t samplewebapp:latest .'
        sh 'docker tag samplewebapp zali45591/samplewebapp:latest'
        //sh 'docker tag samplewebapp zali45591/samplewebapp:$BUILD_NUMBER'
    }
    
    stage('Push Docker Image'){
       withCredentials([string(credentialsId: 'Docker_Hub_Pwd', variable: 'Docker_Hub_Pwd')]) {
        sh "docker login -u zali45591 -p ${Docker_Hub_Pwd}"
       }
       sh 'docker push zali45591/samplewebapp:latest'
     }
}     
