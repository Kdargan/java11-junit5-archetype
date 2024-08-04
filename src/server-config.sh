#! /bin/bash

sudo yum install git -y
sudo yum install maven -y
sudo yum install java-11-amazon-corretto-1:11.0.23+9-1.amzn2023.x86_64 -y 

if [ -d "java11-junit5-archetype" ]
then
   echo "repo is already cloned and exists"
   cd /home/kdargan/java11-junit5-archetype
   git pull origin master
else
   git clone https://github.com/Kdargan/java11-junit5-archetype.git
   cd java11-junit5-archetype
   git checkout master
fi

export JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto.x86_64
export PATH=$JAVA_HOME/bin:$PATH
source /etc/profile
echo $JAVA_HOME
