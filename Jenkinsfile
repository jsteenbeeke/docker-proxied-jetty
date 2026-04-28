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
				sh 'docker pull registry.jeroensteenbeeke.nl/jetty:12-latest'
			}
		}
		stage('Build') {
			steps {
				sh 'docker build -f Dockerfile.12-jdk-25 -t registry.jeroensteenbeeke.nl/proxied-jetty:12-latest .'
			} 
		}
		stage('Push') {
			steps {
				sh 'docker push registry.jeroensteenbeeke.nl/proxied-jetty:12-latest'
			}
		}
	}
}
