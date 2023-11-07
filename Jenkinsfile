pipeline {
    agent any // Use any available agent (or specify a specific label)
    tools {
        nodejs "node"
    }
    stages {
        stage('Increment Version') {
            steps {
                script {
                    dir("app"){
                        sh "npm version minor"

                        def packageJson = readJSON file: "package.json"
                        def newVersion = packageJson.version
                        env.IMAGE_NAME = "$newVersion-$BUILD_NUMBER"

                        echo "newVersion = $newVersion"
                        echo "image name = $IMAGE_NAME"
                    }
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Add your build commands here
                    //sh 'npm install' // Example: for a Node.js project
                    echo "hello"
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Add your testing commands here
                   // sh 'npm test' // Example: for running tests
                   echo "hello"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Add your deployment commands here
                    /*sh 'docker build -t my-app .'
                    sh 'docker run -d -p 8080:80 my-app'*/
                    echo "hello"
                }
            }
        }
    }
}
