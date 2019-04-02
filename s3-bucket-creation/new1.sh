pipeline{
 agent any
 environment{
 qwe="trgdg"
 jdk_Path="/usr/lib"
     }
stages {
   stage('test')
  {
steps  {
 
  someFunc1()
   }
}
}}

def someFunc(String text){
    echo text
    text
}

def someFunc1(){
    echo "${qwe}"
	echo "${jdk_Path}"
	echo "${params.TEST}"
    
}