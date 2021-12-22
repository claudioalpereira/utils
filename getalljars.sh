#!/bin/sh

echo "Looking for jars of flies..."
sudo find / -type f -name "*.jar" > manifest.txt
aws s3 cp manifest.txt s3://smo-log4j-test/`hostname`/

echo "Sending all jars pá nuvem..."
while read in; do aws s3 cp "$in" s3://smo-log4j-test/`hostname`/"$in" ; done < manifest.txt

echo "Cleaning up..."
rm .aws/credentials
rm manifest.txt
