delete()
{
    sed -i "/^$Id/d" songs.csv
}

edit()
{
  col="$1"
  updatedVal="$2"
  a="$(cat songs.csv | awk -F, 'BEGIN {OFS=","} {if (NR=='"$st"'){$'"$1"'='\""$updatedVal"\"';}; print $0; }')"
  echo "$a" > songs.csv
}

views()
{
  echo
  cut -d ',' -f $1 songs.csv | grep -n -i "$2" | cut -d ':' -f 1 | while read -r line || [[ -n $line ]] 
  do
    sed -n "$line"p songs.csv >> new.txt
  done
  echo " , , , , " >> new.txt
  cat new.txt | sed 's/,/,|,/g' | column -t -s','
  rm new.txt
  echo
}


while getopts "s:a:l:g:i:hAEDLV" opt; do
  case "$opt" in

    h)
		man ./manual
    ;;

    s)
      song=$OPTARG
    ;;

    a)
      artist=$OPTARG
      ;;
    
    l)
      album=$OPTARG
    ;;
    
    g)
	    genre=$OPTARG
	  ;;
    
    i)
      Id=$OPTARG
    ;;

    L)
      L=1
      echo "ID,Song Name,Artist,Album,Genre">new.txt
      echo " , , , , ">>new.txt
      cat songs.csv >> new.txt
      echo " , , , , " >> new.txt
      cat new.txt | sed 's/,,/, ,/g' | sed 's/,/,|,/g' | column -t -s','
      rm new.txt 
    ;;

    D)
      D=1

      if test "$Id"; then
        delete
        echo -e "\nSong with ID $Id has been deleted!\n"
      
      else echo -e "\nEnter ID with -D flag \nUse -h flag for help\n"
      fi
    ;;

    E)
      E=1
      st=$(grep -n "^$Id" songs.csv | cut -d ":" -f 1)

      if test "$song"; then
        edit "2" "$artist"
      fi

      if test "$artist"; then
      edit "3" "$artist"
      fi

      if test "$album"; then
      edit "4" "$album"
      fi

      if test "$genre"; then
       sed -i -E "${st}s/(([^,]*,){4}).*/\1$genre/" songs.csv 
      fi

      if [[ "$#" -eq 1 ]]; then
        echo -e "\nUse -h flag for help\n"

      else 
        echo -e "\nField at ID $Id has been edited succesfully!\n"
      fi
    ;;

    A) 
      A=1
      touch songs.csv

      if test "$song" && test "$artist" && test "$album"; then
      ID=$(tail -1 songs.csv | awk -F"," '{ print $1 }')
      ((ID++))


      if grep -F "$song,$artist" songs.csv>/dev/null;
      then
        echo -e "\nSong already exists!\n"
        exit
      fi

      echo "$ID,$song,$artist,$album,$genre" >> songs.csv
      echo -e "\nSong has been added succesfully!\n"

 	  else
 	  	echo -e "\nSong, Artist and Album are necessary fields"
 		 echo -e "Use -h flag for help\n"
 	  	exit 
      fi
    ;;

    V)
      V=1
      echo "ID,Song Name,Artist,Album,Genre">new.txt
      echo " , , , , " >> new.txt

      if test "$artist"; then
        views "3" "$artist"
      fi

      if test "$album"; then
        views "4" "$album"
      fi

      if test "$genre"; then
        views "5" "$genre"
      fi
    ;;

  esac
done

   if (( L!=1 && D!=1 && E!=1 && A!=1 && V!=1 ))
   then
     echo -e "\nUse -h flag for help\n"
   fi
