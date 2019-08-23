#!/bin/bash

sudo su
#update server
sudo yum update

#install open jdk
sudo yum install java latest

#install git
sudo yum install -y git

#install maven and set path in environment variable
sudo wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
echo $'iexport M2_HOME=/opt/maven
\nexport PATH=${M2_HOME}/bin:${PATH}\E:x\n' | vi /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
mvn -version

#install jenkins
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install -y jenkins
sudo systemctl start jenkins
systemctl status jenkins
sudo systemctl enable jenkins