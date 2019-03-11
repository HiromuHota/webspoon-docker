pipeline {
  agent any
  environment {
    version      = 'nightly'
  }
  stages {
    stage('Build') {
      steps {
        sh '''
          docker build --build-arg version=$version --build-arg CACHEBUST=$BUILD_NUMBER -t hiromuhota/webspoon:$version --pull=true .
          docker tag hiromuhota/webspoon:$version hiromuhota/webspoon:$version-full
        '''
      }
    }
    stage('Publish') {
      steps {
        withDockerRegistry([ credentialsId: "4df8ec3b-c6ab-4ea8-adc7-01328b7b3154", url: "" ]) {
          sh '''
            docker push hiromuhota/webspoon:$version
            docker push hiromuhota/webspoon:$version-full
          '''
        }
      }
    }
  }
}
