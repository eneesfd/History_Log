#!/bin/bash

while [ 1 ]
do

DATE_BIN=$(command -v date)
DATE=`${DATE_BIN} +%y-%m-%d--%H:%M:%S`

HISTFILE=~/.bash_history  # History dosyasını tanımlamasını yapıyor.
HISTTIMEFORMAT='%F %T '   # History nin zaman formatını düzenliyor
set -o history            # Historyi etkinleştiriyor.
#export PROMPT_COMMAND="history 1 >> $HOME/.history-timestamp;"

# main_whoami=$(history | grep -c -o "whoami") 
# main_su=$(history | grep -c -o "su")
# main_id=$(history | grep -c -o "id")

#echo PROMPT_COMMAND='history -a' >> ~/.bashrc

if [[ -f /home/enes/repos/History_Log/history.txt ]]
# Şuanda dosyayı karşılaştırıyor bu yanlış için 
then
    main_whoami=$(history | grep -c -o "whoami") 
    main_su=$(history | grep -c -o "su")
    main_id=$(history | grep -c -o "id")
    if cmp -s ~/.bash_history /home/enes/repos/History_Log/history.txt
    then
    echo "Files are the same"
    else
    echo "Files are different"
    file="/home/enes/repos/History_Log/history.txt"
    for ((i=1; i <= $main_id ; i++)) do
    echo "USER=$USER TIME=$DATE COMMAND=id" >> /tmp/make.txt
    done
    for ((i=1; i <= $main_whoami ; ++i)) do
    echo "USER=$USER TIME=$DATE COMMAND=whoami" >> /tmp/make.txt
    done
    for ((i=1; i <= $main_su ; i++)) do
    echo "USER=$USER TIME=$DATE COMMAND=su" >> /tmp/make.txt
    done
    cat /dev/null > ~/.bash_history #History i sıfırlıyor.
    history -c
    #PROMPT_COMMAND='history -a'
    fi
else
    touch /home/enes/repos/History_Log/history.txt  # Kayıt etiliecek file dosyası yoksa yaratıyor.
    file="/home/enes/repos/History_Log/history.txt"
    for ((i=1; i <= $main_id ; i++)) do
    echo "USER=$USER TIME=$DATE COMMAND=id" >> /tmp/make.txt
    done
    for ((i=1; i <= $main_whoami ; i++)) do
    echo "USER=$USER TIME=$DATE COMMAND=whoami" >> /tmp/make.txt
    done
    for ((i=1; i <= $main_sudo ; i++)) do
    echo "USER=$USER TIME=$DATE COMMAND=su" >> /tmp/make.txt
    done
    cat /dev/null > ~/.bash_history #History i sıfırlıyor.
    #PROMPT_COMMAND='history -a'
fi
sleep 2
# cat /dev/null > ~/.bash_history #History i sıfırlıyor.
# PROMPT_COMMAND='history -a'
done