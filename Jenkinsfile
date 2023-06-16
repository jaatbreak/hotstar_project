pipeline{
	agent{
		label "dev"
	}
	stages{
		stage("pull"){
			steps{
		          git branch: 'main', url: 'https://github.com/jaatbreak/hotstar_project.git'
			}
		}
		stage("install docker"){
			steps{
				build quietPeriod: 5, job: 'job-hotstar'
			}
		}
		stage("Build"){
			steps{
				sh 'sudo docker build -t hotstar:BUILD_TAG .'
				sh 'sudo docker tag hotstar:BUILD_TAG amansingh12/hoster:BUILD_TAG'
			}
		}
		stage("push"){
			steps{
				withCredentials([string(credentialsId: 'docker_hub', variable: 'docker_var')]){
					sh 'sudo docker login -u amansingh12 -p $docker_var'
					sh 'sudo docker push amansingh12/hoster:BUILD_TAG'
				}
			}
		}
		stage("testing"){
			steps{
				docker run -dit -p :80  amansingh12/hoster:BUILD_TAG
			}
		}
		
	}
}
