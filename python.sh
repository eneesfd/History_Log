#!/bin/bash

DATE_BIN=$(command -v date)
DATE=`${DATE_BIN} +%y-%m-%d--%H:%M:%S`
if [[ -f make.txt ]]
then
    while IFS= read -r line
    do
        test=$(grep -w 'whoami' "/home/fdagdelennb/.bash_history")
        echo -e "USER=$USER COMMAND=$test $line" >> make.txt
    done <"/home/fdagdelennb/.bash_history"
else
    echo "make doesn't exist"
    touch make.txt
fi