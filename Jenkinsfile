pipeline {
    agent any

    tools {
        jdk 'JAVA_HOME'
        maven 'M2_HOME'
    }

    stages {

        stage('Checkout') {
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/tycoonvirat-dot/jenkins-tomcat-webapp.git'
            }
        }

        stage('Compile') {
            steps {
                sh 'mvn compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn clean package'
                sh 'mv target/*.war target/myweb.war'
            }
        }

        stage('Backup (Deploy to Nexus)') {
            steps {
                sh 'mvn deploy'
            }
        }

        /*
        stage('Deploy to Tomcat') {
            steps {
                sshagent(['tomcat']) {
                    sh """
                    scp -o StrictHostKeyChecking=no target/myweb.war ec2-user@13.204.75.174:/home/ec2-user/tomcat10/webapps/

                    ssh ec2-user@13.204.75.174 /home/ec2-user/tomcat10/bin/shutdown.sh
                    ssh ec2-user@13.204.75.174 /home/ec2-user/tomcat10/bin/startup.sh
                    """
                }
            }
        }
        */
    }
}
