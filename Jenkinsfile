pipeline {
	agent {
		label 'docker'
	}

	options {
		buildDiscarder(logRotator(numToKeepStr: '5'))
		disableConcurrentBuilds()
	}

	stages {
		stage('Prepare') {
			steps {
				sh 'docker pull jetty:alpine'
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
