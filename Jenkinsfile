node {
 env.dev = 'adzadmin@172.30.2.88'
 env.test = 'adzadmin@172.30.2.206'
 env.dev_hostname = 'ip-172-30-2-88.ec2.internal'
 env.test_hostname = 'ip-172-30-2-206'
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
   stage "Test server"
   input id: 'Approve', message: 'Approve', ok: 'Yes'
   sh 'sed -ie \'s/${dev_env}/\'"${dev_hostname}"\'/g\' scriptfile.sh'
   sh "ssh $dev 'bash -s' < scriptfile.sh"
  }
