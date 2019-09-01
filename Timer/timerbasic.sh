#!/bin/bash
if(( "$#"!=1 ));
then 
	echo -e "\nEnter Valid number of arguments\n"
	exit
fi

	echo
	echo "Starting project.."
	sleep 1

c=1
while (( $c <= $1 )) 
do
	echo
	echo "#$c Work!"
	sleep 25m
	
	if (( $c%4==0 ))
	then
		echo "#$c Long Break"
		sleep 15m

	else 
		echo "#$c Break"
		sleep 5m
	fi

	((c++))
done

echo -e "\nFinished! Kudos! \n"
