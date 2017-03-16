node{
    env.dev= 'adzadmin@172.30.2.88'
    env.test= 'adzadmin@172.30.2.206'
    env.dev_hostname= 'ip-172-30-2-88.ec2.internal'
    env.test_hostname= 'ip-172-30-2-206'
    stage "Checkout"
    checkout scm
    echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
    sh 'sed -ie \'s/${BUILD_NUMBER}/\'"${BUILD_ID}"\'/g\' scriptfile.sh'
    echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
    stage "Clean/Buid"
    sh "chmod +x ./gradlew"
    sh "./gradlew clean build"
    stage "Dev server"
    sh 'sed -ie \'s/${dev_env}/\'"${dev_hostname}"\'/g\' scriptfile.sh'
    sh "ssh $dev 'bash -s' < scriptfile.sh"
    dir('Second_repo') {
    ws('/data/jenkins/browsertest/Secondrepo') {
    stage('Browser test') {
    git credentialsId: '18829a04-8347-4c8e-9737-403e0e7a2723', url: 'git@github.com:ctrlshift/test-harness.git'
    sh "sed -ie \'s/dev.adzhub.com/\'test.adzhub.com\'/g\' src/main/resources/ctrlshift.properties"
    sh "chmod +x ./gradlew"
    sh "./gradlew clean build runSmokeTests"
	   }
        }
   }
   stage "Test server"
   input id: 'Approve', message: 'Approve', ok: 'Yes'
   sh 'sed -ie \'s/${test_env}/\'"${test_hostname}"\'/g\' scriptfile.sh'
   sh "ssh $test 'bash -s' < scriptfile.sh" 
}
