pipeline{
 agent any
stages {
   stage('test')
  {
steps  {
	terraformInstall()
	someFunc1()
  sh '''
  sudo -S apt-get install unzip
	sudo -S wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
	sudo -S unzip terraform_0.11.13_linux_amd64.zip
	sudo -S mv terraform /usr/local/bin/
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