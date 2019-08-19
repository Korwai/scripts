#!/bin/bash
LOOP=true
function match {
    #If the script finds a match, it will format that element into this so it is more readable.
    echo "Name is: $1"
    echo "Home Phone Number is: $2"
    echo "Mobile Phone Number is: $3"
    echo "Address is: $4"
    echo "Birthday is: $5"
    echo "Salary is: \$$6"
    echo ""
}
while [ $LOOP = true ]; do
    #Print the menu.
    echo "(1) List records in alphabetical order."
    echo "(2) List records in reverse alphabetical order."
    echo "(3) Search records by last name."
    echo "(4) Search records by birthday."
    echo "(5) Exit."
    read MENU1_INPUT
    case $MENU1_INPUT in
	1)
	    #Sort by alphabetical
	    clear
	    cat phonebook.txt | sort -n
	    ;;
	2)
	    #Sort by reverse alphabetical
	    clear
	    cat phonebook.txt | sort -nr
	    ;;
	3)
	    #Search by last name.
	    clear
	    echo "Searching. Please input a last name."
	    read NAME
	    OUTPUT=`grep "$NAME" phonebook.txt`
	    #Changes the Internal Field Seperator to colon so that the match function is able to use the $OUTPUT properly.
	    IFS=':'
	    if [ -z "$OUTPUT" ]; then
                echo "No matches."
	    else
		match $OUTPUT
	    fi
       	    ;;
	4)
	    #Search by birthday
	    clear
	    LOOP2=true
	    while [ $LOOP2 = true ]; do
	    echo "Please select your search input."
	    echo "(1) MM/DD/YY"
	    echo "(2) MM"
	    echo "(3) YYYY"
	    read MENU2_INPUT
	    if [ $MENU2_INPUT -gt 4 ] || [ $MENU2_INPUT -lt 0 ]; then
		echo "Please select an option."
	    else
		echo "Please enter the birthdate according to the syntax selected."
		read BIRTHDAY
		case $MENU2_INPUT in
		    1)
			OUTPUT=`grep ":$BIRTHDAY:" phonebook.txt`
			IFS=':'
			if [ -z "$OUTPUT" ]; then
			    echo "No matches."
			else
                            match $OUTPUT
			fi
			;;
		    2)
			IFS=$'\n'
			ARR=(`grep ":$BIRTHDAY/" phonebook.txt`)
			IFS=':'
			for (( i=0; i<${#ARR[@]}; i++ )); do
			    match ${ARR[$i]}
			done		       
			;;
		    3)
			YEAR=${BIRTHDAY:2:4}
			IFS=$'\n'
                        ARR=(`grep "/$YEAR:" phonebook.txt`)
                        IFS=':'
                        for (( i=0; i<${#ARR[@]}; i++ )); do
                            match ${ARR[$i]}
                        done
			;;
		    *)
			
		esac
	    fi
	    done
	    ;;
	5)
	    #Exit out of the loop and script.
	    LOOP=false
	    ;;
	*)
	    clear
	    echo "Please enter a proper option."
	    ;;
    esac
done
