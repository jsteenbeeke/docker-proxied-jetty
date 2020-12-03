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
				sh 'docker pull registry.jeroensteenbeeke.nl/jetty:9-jre11'
				sh 'docker pull registry.jeroensteenbeeke.nl/jetty:10-jre11'
			}
		}
		stage('Build') {
			steps {
				sh 'docker build -f Dockerfile.9-jre-11 -t registry.jeroensteenbeeke.nl/proxied-jetty:9-latest .'
				sh 'docker build -f Dockerfile.10-jre-11 -t registry.jeroensteenbeeke.nl/proxied-jetty:10-latest .'
			} 
		}
		stage('Push') {
			steps {
				sh 'docker push registry.jeroensteenbeeke.nl/proxied-jetty:9-latest'
				sh 'docker push registry.jeroensteenbeeke.nl/proxied-jetty:10-latest'
			}
		}
	}
}
