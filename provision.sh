#!/bin/bash -eux

# Install Ansible repository.
sudo apt-get -y update
sudo apt-get -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible

# Install Ansible.
sudo apt-get -y update
sudo apt-get -y install ansible

# Install AMI Tools.
sudo apt-get install -y ruby unzip
wget https://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.zip
sudo mkdir -p /usr/local/ec2
sudo unzip ec2-ami-tools.zip -d /usr/local/ec2
export EC2_AMITOOL_HOME=/usr/local/ec2/`ls /usr/local/ec2 | grep ec2-ami-tools | grep -v zip`/bin
echo "EC2_AMITOOL_HOME="$EC2_AMITOOL_HOME
export PATH=$EC2_AMITOOL_HOME+":"+$PATH
