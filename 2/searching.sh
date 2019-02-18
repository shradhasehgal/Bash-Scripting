#!/bin/bash
if [[ "$#" -ne 2 ]];
then
echo "Enter valid number of arguments"
echo "Correct usage is: Word_to_Search_for URL"
exit

elif curl -o /dev/null -s -f "$1";
then
	echo "Reverse order of arguments" 
	echo "Correct usage is: Word_to_Search_for URL"
	exit
fi

if curl -o /dev/null -s -f "$2"; 
then
	ans=$(curl -s "$2" | tr '\n' ' ' | sed 's/style[^"style"]*style//g' | sed 's/script[^"script"]*script//g' | sed 's/<[^>]*>//g' | grep -i -o -w "$1" | wc -l)
	echo $1 $ans
else 
	echo "URL is incorrect"
fi
