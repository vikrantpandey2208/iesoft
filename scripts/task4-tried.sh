#!/bin/bash

grep -rnw . -e 'bash'
#time= 17.394s

#only file name
grep -Ril 'while'
#time= 5.928s

grep -rn 'while'
#time= 9.681

rg 'while'
#time = 0.544s

# Old script
# approx 32s +