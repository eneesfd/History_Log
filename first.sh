#!/bin/sh

NAME="MET-3-get-code-from-string"
por="$(echo "$NAME" | grep -P -o -e '(?<=MET-).*?(\d+)')"

while IFS= read -r line
do
echo -e $line >> make.txt
done < $por