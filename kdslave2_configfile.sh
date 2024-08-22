#! /bin/bash

sudo su -
sudo yum install git -y
sudo yum install maven -y
sudo yum install java-11-openjdk.x86_64 -y

if { -d java11-junit5-archetype}
then
echo "Git repo already clones. Already existed!!!"
cd /root/java11-junit5-archetype
git pull origin java11-junit5-archetype
else
git clone https://github.com/Kdargan/java11-junit5-archetype.git
cd java11-junit5-archetype
git checkout master
fi

//define env. variable of java & maven.
