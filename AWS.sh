#!/bin/sh
###docker###
yum update -y
amazon-linux-extras install docker -y
service docker start
sudo usermod -aG docker ec2-user
systemctl enable docker
###docker-compose###
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
###vim htop git ###
yum install vim htop git -y
###git user###
git config --global user.name "Johnimony"
git config --global user.email ujif12349@yandex.ru
###ssh-keygen###
ssh-keygen -t rsa -b 4096 -C "ujif12349@yandex.ru" -f "/home/ec2-user/.ssh/id_rsa" -q -P ""
eval "$(ssh-agent -s)"
ssh-add /home/ec2-user/.ssh/id_rsa
###dir prodject###
#mkdir /home/ec2-user/prodject
###install gitlab runner ###
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | sudo bash
sudo yum install gitlab-runner -y
