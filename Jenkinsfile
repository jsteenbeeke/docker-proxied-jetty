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
				sh 'docker pull registry.jeroensteenbeeke.nl/jetty:10.0-jdk17'
				sh 'docker pull registry.jeroensteenbeeke.nl/jetty:10.0-jdk20'
			}
		}
		stage('Build') {
			steps {
				sh 'docker build -f Dockerfile.10-jdk-17 -t registry.jeroensteenbeeke.nl/proxied-jetty:10-jdk17 .'
				sh 'docker build -f Dockerfile.10-jdk-20 -t registry.jeroensteenbeeke.nl/proxied-jetty:10-jdk20 .'
			} 
		}
		stage('Push') {
			steps {
				sh 'docker push registry.jeroensteenbeeke.nl/proxied-jetty:10-jdk17'
				sh 'docker push registry.jeroensteenbeeke.nl/proxied-jetty:10-jdk20'
			}
		}
	}
}
