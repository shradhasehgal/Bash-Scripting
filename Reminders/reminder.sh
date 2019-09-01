delete()
{
      n=$(grep -n "^$Id" rem.txt | cut -d ":" -f 1)
      n=$(sed -n "$n"p rem.txt | cut -d',' -f 2)
      at -d "$n"
      sed -i "/^$Id/d" rem.txt

}

edit()
{
  va=$(sed -n "$st"p rem.txt | awk -v var="$1" -F "," '{ print $var }')
  sed -i "${st}s/$va/$2/g" rem.txt
}
 

while getopts "hd:t:r:I:LDEA" opt; do
  case "$opt" in
  	h)
    	h=1
		man ./remman
	   ;;

    d)
      Date=$OPTARG
      ;;

    t)
      Time=$OPTARG
      ;;

    r)
	    Reminder=$OPTARG
	  ;;

    I)
      Id=$OPTARG
    ;;

    L)
      l=1
      echo "User ID,|,Job no,|,Date,|,Time,|,Reminder" > temp.txt
      echo " ,|, ,|, ,|, ,|, " >> temp.txt

        while getopts "sd" arg; do
          case "$arg" in 
          
            d)
              sed 's/ /,/1' rem.txt | sort -t, -k 3M -k 4 -n | sed 's/,/,|,/g' | sed 's/,|,/ /3' >>temp.txt
            ;;

            s)
			       sort -t, -k5 rem.txt | sed 's/,/,|,/g' >> temp.txt 
            ;;
           
        esac
      done

      if [[ "$#" -eq 1 ]];
      then 
          sort -t, -k4 rem.txt | sed 's/,/,|,/g' >> temp.txt  
      fi

      column -s ',' -t temp.txt
    
      rm temp.txt
    ;;

    D)
      d=1
      if test "$Id"; then
        delete
        echo -e "\nReminder deleted successfully!\n"

      else echo -e "\nEnter ID\nUse -h flag for help\n"
      fi
    ;;


    E)
      e=1
      if test "$Id"; then
        st=$(grep -n "^$Id" rem.txt | cut -d ":" -f 1)

        n=$(grep -n "^$Id" rem.txt | cut -d ":" -f 1)

        if test "$Time"; then
          edit "4" "$Time"
          Reminder=$(sed -n "$n"p rem.txt | cut -d',' -f 5)
        fi

        if test "$Reminder"; then
          edit "5" "$Reminder"
          Time=$(sed -n "$n"p rem.txt | cut -d',' -f 4)
        fi

        i=$(sed -n "$n"p rem.txt | cut -d',' -f 2)              #Getting Job ID
        at -d "$i"                                              #Deleting the job
        
        Date=$(sed -n "$n"p rem.txt | cut -d',' -f 3)

        info=`echo "notify-send "$Reminder" -t 0" | at "$Time $Date" 2>&1`
        Job=$(echo "$info" | tail -n 1 | cut -d' ' -f 2)
        edit "2" "$Job"

        echo -e "\nReminder edited successfully!\n"

      else echo -e "\nEnter Id\nUse -h flag for help\n"
      fi
    ;;


    A) 
      a=1 
      touch rem.txt

      if test "$Time" && test "$Reminder" && test "$Date";
      then
          ID=$(tail -1 rem.txt | awk -F"," '{ print $1 }')
          ((ID++))

      info=`echo "notify-send "$Reminder" -t 0" | at $Time $Date 2>&1`

      Job=$(echo "$info" | tail -n 1 | cut -d' ' -f 2)
      echo "$ID,$Job,$Date,$Time,$Reminder" >> rem.txt

      echo -e "\nReminder $ID added successfully!\n"

 	  else
 	       echo -e "\nPlease give valid input\n"
 		     echo -e "Use -h flag for help\n"
 	  	   exit 
    fi
    
    ;;

  esac
done

  if [[ "$#" -eq 0 ]];
  then 
  	echo -e "\nUse -h flag for help\n"   

  elif (( e!=1 && l!=1 && d!=1 && a!=1 && h!=1))
    then
      echo -e "\nInvalid arguments\nUse -h flag for help\n"
  fi      






