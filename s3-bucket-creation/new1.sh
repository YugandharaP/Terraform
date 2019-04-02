pipeline{
 agent any
stages {
   stage('test')
  {
steps  {
	terraformInstall()
	someFunc1()
  sh '''
	export access_key = ${params.access_key}
	export secret_key = ${params.secret_key}
	#sudo apt-get install unzip
	sudo wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
	sudo unzip terraform_0.11.13_linux_amd64.zip
	echo $PWD
	sudo mv terraform /var/lib/jenkins/workspace/jenks/s3-bucket-creation/
	cd /var/lib/jenkins/workspace/jenks/s3-bucket-creation/
	./terraform --version
	./terraform init
	./teraform plan -auto-approve -var access_key = ${params.access_key} secret_key = ${params.secret_key}
	./terraform apply -auto-approve -var access_key = ${params.access_key} secret_key = ${params.secret_key}
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