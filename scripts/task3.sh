#! /bin/bash

echo This script provides various option to examine and manipulate CSV files.
echo "" 

echo Sorting CSV file on serial column reverse order
echo "" 

csvsort -c 1 -r data.csv

echo "" 
echo Sorting CSV file on Fraction and profit column reverse order
echo "" 

csvsort -c fraction,profit -r data.csv

echo "" 
echo Filtering CSV file on type column this will show data if type contains Binders
echo "" 

csvgrep -c type -m Binders data.csv

echo "" 
echo Filtering CSV file on type column this will show data if value is starting with "S"
echo "" 

csvgrep -c type -r "^S" data.csv

echo "" 
echo Using Pipeline to get only values of type column which starts with "S"
echo "" 

csvgrep -c type -r "^S" data.csv | csvsort -c 1 -r | csvcut -c type

echo "" 
echo Showing max of each column
echo "" 
csvstat --max data.csv

echo "" 
echo Showing min of each column
echo "" 
csvstat --min data.csv

echo "" 
echo Showing AVG of each column
echo "" 
csvstat --mean data.csv

echo "" 
echo Showing number of rows
csvstat --count data.csv