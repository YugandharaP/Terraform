pipeline{
 
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
def someFunc2(String text2){
    echo text2
    text2
}