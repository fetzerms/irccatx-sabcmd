#!/bin/bash
if which sudo >/dev/null; then
	sudo apt-get install maven openjdk-7-jdk
else
	apt-get install maven openjdk-7-jdk
fi

git clone https://github.com/fetzerms/irccatx.git irccatx-source
cd irccatx-source

mvn package

cp target/irccatx.jar ..

echo "Start with java -jar irccatx.jar"
