pipeline {
	agent {
		label 'docker'
	}

	options {
		buildDiscarder(logRotator(numToKeepStr: '5'))
		disableConcurrentBuilds()
	}

	triggers {
		pollSCM('H/30 * * * *')
		upstream (upstreamProjects: 'docker-jetty', threshold: hudson.model.Result.SUCCESS)
	}

	stages {
		stage('Prepare') {
			steps {
				sh 'docker pull jetty:9-jre11'
			}
		}
		stage('Build') {
			steps {
				sh 'docker build -t registry.jeroensteenbeeke.nl/proxied-jetty:latest .'
			} 
		}
		stage('Push') {
			steps {
				sh 'docker push registry.jeroensteenbeeke.nl/proxied-jetty:latest'
			}
		}
	}
}
