pipeline {
    agent any 
      tools {
        maven 'maven-3.9.0'
    }
stages {
    stage('Test Execution') {
      steps {
        
            script {
                bat ("mvn test")
            }
           
      }
    }

    stage('Upload report') {
      steps {
        
            script {
                publishHTML (target: [
                    allowMissing: false, 
                    keepAll: true,  
                    reportDir: 'target/karate-reports/',
                    reportFiles: 'karate-timeline.html',
                    reportName: 'Maru Report'])
            }           
      }
    }

  }
    
}