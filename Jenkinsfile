pipeline {
  agent any

  parameters {
    choice(
      name: 'ENVIRONMENT',
      choices: ['dev', 'prod'],
      description: 'Select the environment to apply Terraform'
    )
  }

  environment {
    AWS_CREDENTIALS_JSON = credentials('49889777-1b0c-4158-8ada-9ac907f1877f')
  }

  stages {
    stage('Set AWS Credentials') {
      steps {
        script {
          def awsCredentials = readJSON(text: AWS_CREDENTIALS_JSON)
          env.AWS_ACCESS_KEY_ID = awsCredentials.aws_access_key_id
          env.AWS_SECRET_ACCESS_KEY = awsCredentials.aws_secret_access_key
        }
      }
    }

    stage('Clone Repository') {
      steps {
        git branch: 'main', url: 'https://github.com/alaa-alshitany/Project_DevOps_Tools'
      }
    }

    stage('Initialize Terraform') {
      steps {
        script{
          dir('Terraform'){
              sh 'terraform init'
          }
        }
      }
    }
  stage('Refresh Terraform') {
        steps {
          script {
            dir('Terraform'){
            def tfVarsFile = (params.ENVIRONMENT == 'dev') ? 'Dev_vars.tfvars' : 'Prod_vars.tfvars'
            sh 'terraform refresh -var-file=$tfVarsFile'
          }
        }
      }
      }
    stage('Plan Terraform') {
      steps {
        script {
          dir('Terraform'){
          def tfVarsFile = (params.ENVIRONMENT == 'dev') ? 'Dev_vars.tfvars' : 'Prod_vars.tfvars'
          sh "terraform plan -var-file=$tfVarsFile"
        }
       }
      }
    }

    stage('Apply Terraform') {
      steps {
        script {
          dir('Terraform'){
          def tfVarsFile = (params.ENVIRONMENT == 'dev') ? 'Dev_vars.tfvars' : 'Prod_vars.tfvars'
          sh "terraform apply -auto-approve -var-file=$tfVarsFile"
        }
      }
    }
    }
    //  stage('Destroy Resourses'){
    //     steps{
    //          script {
    //         def tfVarsFile = (params.ENVIRONMENT == 'dev') ? 'Dev_vars.tfvars' : 'Prod_vars.tfvars'
    //         sh "terraform destroy --auto-approve -var-file=$tfVarsFile"
    //     }
    //   }
    // }
    
  }
}
