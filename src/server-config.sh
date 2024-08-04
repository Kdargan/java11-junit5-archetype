#! /bin/bash

sudo yum install git -y
sudo yum install maven -y
sudo yum install java-1.8.0-openjdk-devel -y 

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

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.402.b06-1.amzn2.0.1.x86_64
export PATH=$JAVA_HOME/bin:$PATH
source /etc/profile
mvn package
