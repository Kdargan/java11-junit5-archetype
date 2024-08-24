#! /bin/bash

sudo su -
sudo yum install git -y
sudo yum install maven -y
sudo amazon-linux-extras install java-openjdk11 -y

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.23.0.9-2.amzn2.0.1.x86_64
export PATH=$JAVA_HOME/bin:$PATH
source /etc/profile
echo ${JAVA_HOME}

if [ -d 'java11-junit5-archetype'] 
then
echo "Git repo already cloned. Already existed!!!"
cd /home/ec2-user/java11-junit5-archetype
git pull origin master
else
echo "cloning git repo:kd"
git clone https://github.com/Kdargan/java11-junit5-archetype.git
cd java11-junit5-archetype
git checkout master
fi

