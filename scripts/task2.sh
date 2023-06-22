#! /bin/bash

file="test.log"

tail -f "$file" |
    while read -r line; do
        echo "$line" | grep -i "error"
        if [ $? = 0 ]; then

            template='From: "Log Monitoring Service" vikrantpandey466@gmail.com
To: "Vikrant Pandey" vikrant.pandey@iesoftek.com
Subject: Some problems occured in system

Hi admin,
Below are some error that occured recently. 

'

            template+=$line

            curl --ssl-reqd \
                --url 'smtps://smtp.gmail.com:465' \
                --user 'vikrantpandey466@gmail.com:password here' \
                --mail-from 'vikrantpandey466@gmail.com' \
                --mail-rcpt 'vikrant.pandey@iesoftek.com' \
                -T - <<<"$template"
        fi
    done
