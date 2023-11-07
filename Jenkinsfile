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
                    sh "echo $PWD | docker login -u $USER --password-stdin"
                    sh "docker build -t denorjhan/node-app:${IMAGE_NAME} ."
                    sh "docker push denorjhan/node-app:${IMAGE_NAME}"
                }
            }
        }

        stage('Commit Version Increment') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'PWD', usernameVariable: 'USER')]) {
                        sh "git config --global user.email jenkins@jenkins.com"
                        sh "git config --global user.name jenkins"
                        sh "git status"
                        sh "git remote set-url origin https://${USER}:${PWD}@github.com/Denorjhan/jenkins.git"
                        sh "git add ."
                        sh "git commit -m 'ci pipeline: auto-increment version'"
                        sh "git push origin HEAD:main"
                     }
                }
            }
        }
    }
}
