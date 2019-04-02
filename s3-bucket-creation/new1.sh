pipeline{
 agent none
stages {
   stage('test')
  {
steps  {
   sh "echo $PWD"
   def whatThe = someFunc('textToFunc')}
}
}}

def someFunc(String text){
    echo text
    text
}
def someFunc2(String text2){
    echo text2
    text2
}