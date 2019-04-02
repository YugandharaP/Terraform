pipeline{
 agent any
stages {
   stage('test')
  {
steps  {
	terraformInstall()
	someFunc1()
  sh '''
  
  sudo apt-get install unzip
	sudo wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
	sudo unzip terraform_0.11.13_linux_amd64.zip
	sudo mv terraform /usr/local/bin/
	terraform --version
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