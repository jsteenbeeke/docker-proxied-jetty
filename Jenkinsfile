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
	}

	stages {
		stage('Prepare') {
			steps {
				sh 'docker pull jetty:10.0.6-jdk11-slim'
				sh 'docker pull registry.jeroensteenbeeke.nl/jetty:10.0.6-jdk17-slim'
			}
		}
		stage('Build') {
			steps {
				sh 'docker build -f Dockerfile.10-jre-11 -t registry.jeroensteenbeeke.nl/proxied-jetty:10-latest .'
				sh 'docker build -f Dockerfile.10-jre-17 -t registry.jeroensteenbeeke.nl/proxied-jetty:10-jdk17 .'
			} 
		}
		stage('Push') {
			steps {
				sh 'docker push registry.jeroensteenbeeke.nl/proxied-jetty:10-latest'
				sh 'docker push registry.jeroensteenbeeke.nl/proxied-jetty:10-jdk17'
			}
		}
	}
}
