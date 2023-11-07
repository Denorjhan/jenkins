pipeline {
    agent any // Use any available agent (or specify a specific label)
    tools{
        nodejs "node"
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    // Check out your source code from a version control system
                    //checkout scm
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Add your build commands here
                    //sh 'npm install' // Example: for a Node.js project
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Add your testing commands here
                   // sh 'npm test' // Example: for running tests
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Add your deployment commands here
                    /*sh 'docker build -t my-app .'
                    sh 'docker run -d -p 8080:80 my-app'*/
                }
            }
        }
    }

}
