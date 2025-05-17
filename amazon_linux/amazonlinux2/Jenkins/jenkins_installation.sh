#!/bin/bash

set -e

echo "-----------------------------"
echo " Installing Java 17 (Amazon Corretto)"
echo "-----------------------------"
sudo yum install -y java-17-amazon-corretto
java -version

echo "-----------------------------"
echo " Adding the official Jenkins repository"
echo "-----------------------------"
sudo curl --silent --location --output /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key

echo "-----------------------------"
echo " Cleaning Yum Cache"
echo "-----------------------------"
sudo yum clean all
sudo yum makecache fast

echo "-----------------------------"
echo " Installing Jenkins"
echo "-----------------------------"
sudo yum install -y jenkins

echo "-----------------------------"
echo " Enabling and Starting Jenkins"
echo "-----------------------------"
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "-----------------------------"
echo " Verifying Jenkins status"
echo "-----------------------------"
sudo systemctl status jenkins --no-pager

echo "-----------------------------"
echo " Jenkins Initial Admin Password"
echo "-----------------------------"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "-----------------------------"
echo "Jenkins installed and running"
echo "-----------------------------"