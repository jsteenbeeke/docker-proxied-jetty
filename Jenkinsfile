pipeline {
	agent {
		label 'docker'
	}

	options {
		buildDiscarder(logRotator(numToKeepStr: '5'))
		disableConcurrentBuilds()
	}

	stages {
		stage('Build') {
			sh 'docker build -t registry.jeroensteenbeeke.nl/proxied-jetty:latest .' 
		}
		stage('Push') {
			sh 'docker push registry.jeroensteenbeeke.nl/proxied-jetty:latest'
		}
	}
}
