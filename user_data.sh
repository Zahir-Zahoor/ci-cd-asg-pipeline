#!/bin/bash
sudo su
dnf update -y
dnf upgrade -y
dnf install nginx -y
systemctl enable nginx
systemctl start nginx
dnf install ruby -y
dnf install wget -y
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
./install auto
systemctl enable codedeploy-agent
systemctl start codedeploy-agent
