pipeline {
    agent none 
    stages {
        stage('Build Artifact') {
        agent { 
            docker {image '10.128.0.4:8123/mymaven'}
            }
           steps {                                               
                git 'https://github.com/yura40klg/box2.git'
                sh '''mvn deploy'''
                
            }
        }
        stage('make docker image'){
            agent any
            steps{
                sh '''docker build -t mywebbox . && docker login -u admin -p yura325bn 10.128.0.4:8123 && docker tag mywebbox 10.128.0.4:8123/mywebbox'''
                sh 'docker push 10.128.0.4:8123/mywebbox'
            }
        }
        stage ('run docker container'){
                agent any
                steps{
        sh 'ssh-keyscan -H vm3 >> ~/.ssh/known_hosts'
        sh '''ssh jenkins@vm3 << EOF
       docker login -u admin -p yura325bn 10.128.0.4:8123
       docker pull 10.128.0.4:8123/mywebbox
       docker run -d -p 8080:8080 10.128.0.4:8123/mywebbox
       EOF'''
        }
    }
    }
}
