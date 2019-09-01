if (( "$#"!=2 ));then	
	echo "Enter correct number of arguments"
	exit
fi

mkdir -p "$2"/Bad "$2"/Average "$2"/Good "$2"/Awesome

cat $1 | while read -r line
do
	no=$(echo $line | cut -d ':' -f 2)
	st=$(echo $line | cut -d ':' -f 1)

	if (( $(echo "$no<5" | bc -l) )) 
	then
		touch "$2"/Bad/$st.mp4

	elif (( $(echo "$no<8" | bc -l) ))
	then
		touch "$2"/Average/$st.mp4

	elif (( $(echo "$no<9" | bc -l) )) 
	then
		touch "$2"/Good/$st.mp4

	elif (( $(echo "$no>=9" | bc -l) )) 
	then
		touch "$2"/Awesome/$st.mp4
	fi
	 
done

