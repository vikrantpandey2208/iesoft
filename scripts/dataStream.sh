#! /bin/bash

for (( i = 0; i < 1000; i++));
do  
    echo Log data related to operations $i
    echo Log data related to operations "$i" >> test.log
    
    if [ $((i%5)) == 0 ]; 
    then 
        echo error while performing operation "$i missing file" >> test.log
        echo error while performing operation
    fi

    sleep 1
done