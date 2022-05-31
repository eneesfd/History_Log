#!/bin/bash

HISTFILE=~/.bash_history  # Set the history file.
HISTTIMEFORMAT='%F %T '   # Set the hitory time format.
set -o history            # Enable the history.
grep 
if [[ -f /home/enes/repos/History_Log/history.txt ]]
then
    if cmp -l ~/.bash_history /home/enes/repos/History_Log/history.txt
    then
    echo "Files are the same"
    else
    echo "Files are different"
    file="/home/enes/repos/History_Log/history.txt"
    history >> $file          # Save the history.
    history -cw
    fi
else
    touch /home/enes/repos/History_Log/history.txt
    file="/home/enes/repos/History_Log/history.txt"
    history >> $file          # Save the history.
    history -cw     
fi