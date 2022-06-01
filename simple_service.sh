#!/bin/bash
for i in {1..100}
do
echo $i "- " `date` >> /tmp/simple.log
sleep 5
done