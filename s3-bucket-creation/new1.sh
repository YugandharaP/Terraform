pipeline{
 agent any
stages {
   stage('test')
  {
steps  {
	terraformInstall()
	someFunc1()
  
   }
}
}}

def terraformInstall(){
    sudo apt-get install unzip
	wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
	unzip terraform_0.11.13_linux_amd64.zip
	sudo mv terraform /usr/local/bin/
	terraform --version
	
}

def someFunc1(){
    echo "${acce}"
	echo "${jdk_Path}"
	echo "${params.TEST}"
    
}