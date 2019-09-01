#!/bin/bash
if(( "$#"!=1 ));
then 
	echo -e "\nEnter Valid number of arguments\n"
	exit
fi

	notify-send "Starting project.." -t 0
	sleep 2

c=1
while (( $c <= $1 )) 
do
	notify-send "#$c Work!" -t 0
	sleep 25m
	
	if (( $c%4==0 ))
	then
		notify-send "#$c Long Break" -t 0
		sleep 15m

	else 
		notify-send "#$c Break" -t 0
		sleep 5m
	fi

	((c++))
done

notify-send "Finished!" -t 0

