#!/bin/bash

# Update system
dnf update -y
dnf upgrade -y

# Install Nginx
dnf install -y nginx
systemctl enable nginx
systemctl start nginx

# Install Ruby & Wget (needed for CodeDeploy Agent)
dnf install -y ruby wget

# Install AWS CodeDeploy Agent
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
./install auto

# Enable and start CodeDeploy Agent service
systemctl enable codedeploy-agent
systemctl start codedeploy-agent
