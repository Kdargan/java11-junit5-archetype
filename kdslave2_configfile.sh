#! /bin/bash

sudo su -
sudo yum install git -y
sudo yum install maven -y
sudo yum install java-11-openjdk.x86_64 -y

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.23.0.9-2.amzn2.0.1.x86_64
export PATH=$JAVA_HOME/bin:$PATH
source /etc/profile
echo ${JAVA_HOME}

if [ -d java11-junit5-archetype]
then
echo "Git repo already clones. Already existed!!!"
cd /home/ec2-user/java11-junit5-archetype
git pull origin java11-junit5-archetype
else
git clone https://github.com/Kdargan/java11-junit5-archetype.git
cd java11-junit5-archetype
git checkout master
fi

