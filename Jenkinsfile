pipeline {
    agent any 

    environment {
        GITHUB_REPO       = 'https://github.com'
        SONAR_SERVER_NAME = 'my-sonar-sytem'
        JFROG_URL         = 'http://35.171.28'
        JFROG_REPO        = 'libs-release-local'
        WAR_VERSION       = "app-v${BUILD_NUMBER}.war" 
        ANSIBLE_SERVER_IP = '172.31.30.240' 
    }

    tools {
        maven 'maven3'
    }

    stages {
        stage('Stage 1: Fetch Code from Git Server') {
            steps {
                cleanWs()
                git branch: 'project', url: "${GITHUB_REPO}"
            }
        }

        stage('Stage 2: SonarQube Security Scan') {
            steps {
                withSonarQubeEnv("${SONAR_SERVER_NAME}") {
                    sh 'mvn sonar:sonar -Dsonar.projectKey=my-jenkins-app'
                }
            }
        }

        stage('Stage 3: Package & Upload to JFrog') {
            steps {
                sh 'mvn clean package -DskipTests'
                sh "curl -u admin:Srikanthreddy@123 -X PUT ${JFROG_URL}/${JFROG_REPO}/${WAR_VERSION} -T target/*.war"
            }
        }

        stage('Stage 4: Set Up Files on Separate Ansible Machine') {
            steps {
                sh "ssh -o StrictHostKeyChecking=no ram@${ANSIBLE_SERVER_IP} 'sudo mkdir -p /opt/docker && sudo chown -R ram:ram /opt/docker && sudo chmod 755 /opt/docker'"
                sh "ssh ram@${ANSIBLE_SERVER_IP} 'curl -u admin:Srikanthreddy@123 -X GET ${JFROG_URL}/${JFROG_REPO}/${WAR_VERSION} -o /opt/docker/app.war'"
                sh "scp Dockerfile *.yml ram@${ANSIBLE_SERVER_IP}:/opt/docker/"
            }
        }

        stage('Stage 5: Trigger Playbooks on Separate Ansible Machine') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-password-id', variable: 'DOCKER_PASS')]) {
                    sh """
                        ssh ram@${ANSIBLE_SERVER_IP} "
                            cd /opt/docker
                            ansible-playbook push-image.yml --extra-vars 'DOCKER_HUB_PASSWORD=${DOCKER_PASS}'
                            ansible-playbook k8s-deploy-playbook.yml
                            ansible-playbook k8s-service-playbook.yml
                        "
                    """
                }
            }
        }
    }
}
