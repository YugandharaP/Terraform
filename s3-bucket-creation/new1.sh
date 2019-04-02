pipeline{
 agent any
stages {
   stage('test')
  {
steps  {
  someFunc("TESGHJGJGH")
   }
}
}}

def someFunc(String text){
    echo text
    text
}
