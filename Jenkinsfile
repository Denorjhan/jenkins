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

        stage('Test') {
            steps {
                script {
                    dir("app"){
                        sh "npm install"
                        sh "npm run test"
                    }
                }
            }
        }

        stage('Build and Push Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'PWD', usernameVariable: 'USER')]) {
                    sh "docker build -t denorjhan/deno/node-app:${IMAGE_NAME} ."
                    sh "echo $PWD | docker login -u $USER --password-stdin"
                    sh "docker push denorjhan/deno/node-app:${IMAGE_NAME}"
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
