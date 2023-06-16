pipeline{
    agent{
        label "dev"
    }
    stages{
        stage("Pulling code from git"){
            step{
                git branch: 'main', credentialsId: 'devops_m1', url: 'https://github.com/jaatbreak/hotstar_project.git'
            }
        }
        stage("running job-hotstar"){
            steps{
                build quietPeriod: 5, job: 'job-hotstar'
            }
        }
        stage("Build the image"){
            steps{
                sh 'sudo docker build -t hotstar:BUILD_TAG .'
                sh 'sudo docker tag hotstar:BUILD_TAG amansingh12/hotstar:BUILD_TAG'
            }
            stage("Push the image to docker hub"){
                withCredentials([string(credentilsId: 'docker_hub',variable: 'docker_var')]){
                    sh 'sudo docker login -u amansingh12 -p $docker_var'
                    sh 'sudo docker push amansingh12/hotstar:BUILD_TAG'
                }
                
            }
            
        }
    }
}
