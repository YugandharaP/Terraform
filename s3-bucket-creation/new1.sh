pipeline{
 agent any
stages {
   stage('test')
  {
steps  {
	terraformInstall()
	someFunc1()
  sh '''
	#sudo apt-get install unzip
	#sudo wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
	
	#sudo unzip terraform_0.11.13_linux_amd64.zip
	#sudo mv terraform /usr/local/bin/
	terraform --version
	cd /usr/local/bin/
	terraform init
	teraform plan 
	terraform apply --auto-approve -var access_key = ${params.access_key} secret_key = ${params.secret_key}
	
  '''
   }
}
}}

def terraformInstall(){
    echo "test"
}

def someFunc1(){
 
	echo "${params.TEST}"
    
}