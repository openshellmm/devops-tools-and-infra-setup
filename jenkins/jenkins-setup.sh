#!/bin/bash

#Update your system
sudo apt update && sudo apt upgrade -y


#Install Java (Required for Jenkins)
sudo apt install openjdk-21-jre-headless -y


#Check java version
java --version


#Add Jenkins Repository
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null


#Repo update
sudo apt update -y

#Install Jenkins
sudo apt install jenkins -y


#Jenkins Service Management

#Start the Jenkins Service
sudo systemctl start jenkins.service


#Enable Jenkins Service on Boot
sudo systemctl enable jenkins.service




