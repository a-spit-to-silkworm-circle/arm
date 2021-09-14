#!/bin/sh
touch /var/log/test.log
while true;
do
    echo "$(date '+%Y-%m-%d %H:%M:%S') this is test log" >> /var/log/test.log
    sleep 3s
done
