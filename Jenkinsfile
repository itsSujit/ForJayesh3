node{
    env.dev= 'adzadmin@172.30.2.88'
    env.test= 'adzadmin@172.30.2.206'
    env.dev_hostname= 'ip-172-30-2-88.ec2.internal'
    env.test_hostname= 'ip-172-30-2-206'
    dir('First_repo') {  
        ws('/data/jenkins/jobs/firstmultipipeline/Firstrepo') {
	        stage "Checkout"
			checkout scm
			git credentialsId: '18829a04-8347-4c8e-9737-403e0e7a2723', url: 'git@github.com:ctrlshift/gatewayserv.git'
			echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
			sh 'sed -ie \'s/${BUILD_NUMBER}/\'"${BUILD_ID}"\'/g\' scriptfile.sh'
			echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
			stage "Clean/Buid"
			sh "chmod +x ./gradlew"
			sh "./gradlew clean assemble createZip"
			stage "Dev server"
			sh "scp  -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no build/distributions/gatewayserv-*.zip $test:/home/adzadmin/gatewayserv/"
			sh 'sed -ie \'s/${dev_env}/\'"${dev_hostname}"\'/g\' scriptfile.sh'
			sh "ssh $dev 'bash -s' < scriptfile.sh"
        }
    }
	dir('Second_repo') {     
	    ws('/data/jenkins/jobs/firstmultipipeline/Secondrepo') {
		    stage('Browser test') {
			    
				  git credentialsId: '18829a04-8347-4c8e-9737-403e0e7a2723', url: 'git@github.com:ctrlshift/test-harness.git'
				  sh "chmod +x ./gradlew"
				  sh "./gradlew clean build runSmokeTests
	    	}
	    }
	}

}
