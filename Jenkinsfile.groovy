pipeline {
    agent any 
      tools {
        maven 'maven-3.9.0'
    }
    stages {
        stage('Test') {
            steps {
                sh ('mvn test')
            }
        }
    

        stage('Report') {
            steps {
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/karate-reports/', reportFiles: 'karate-timeline.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
            }
        
    }
    
}}