#!/bin/bash
echo "*** Welcome to Cal Poly's ATM ***"
echo "Please enter your PIN."
for i in {0..3}; do
    read pin
    if [ $i -eq 3 ]; then
	echo "Too illegal PINs. Try again later."
	exit
    elif [ $pin != "111" ]; then
	clear
	echo "Invalid PIN. Please try again."
    else
	break
    fi
done
loop_c=0
checking=1000
saving=1000
function transfer {
    echo "How much money would you like to transfer to your "$2" account?"
    read money
    if [ $1 = "saving" ]; then
	if (( $checking - $money < 0 )); then
	    echo "Invalid transaction. You do not have the funds."
	    return
	fi
        checking=`expr $checking - $money`
        saving=`expr $saving + $money`
        echo "Your savings account balance is now: $"$saving
	sleep 3
    elif [ $1 = "checking" ]; then
        if (( $saving - $money < 0 )); then
            echo "Invalid transaction. You do not have the funds."
            return
        fi
        saving=`expr $saving - $money`
        checking=`expr $checking + $money`
	echo "Your checking account balance is now: $"$checking
	sleep 3
    fi
}
function bal {
    eval num='$'$1
    echo "Your "$1" balance is now: $"$num;
    sleep 3
}
function withdraw {
    echo "Which account would you like to withdraw from?"
    echo "(1) Savings"
    echo "(2) Checking"
    read account
    if [ $account = "1" ]; then
        echo "How much would you like to take out?"
	read take
	if (( $saving - $take < 0 )); then
            echo "Invalid transaction. You do not have the funds."
	    sleep 2
            return
        fi
	saving=`expr $saving - $take`
	echo "Here is your "$take"."
	echo "Your savings account balance is now: $"$saving
	sleep 3
    elif [ $account = "2" ]; then
	echo "How much would you like to take out?"
	read take
	if (( $checking - $take < 0 )); then
            echo "Invalid transaction. You do not have the funds."
	    sleep 2
            return
        fi
	checking=`expr $checking - $take`
        echo "Here is your "$take"."
        echo "Your checking account balance is now: $"$checking
	sleep 3
    else
	echo "Imvalid account. Please select an account."
	sleep 2
	return
    fi
}
while [ $loop_c != 1 ]; do
    clear
    echo "*** Welcome to Cal Poly's ATM ***"
    echo "(1) Transfer from checking account to savings account"
    echo "(2) Transfer from savings account to checking account"
    echo "(3) Savings account balance"
    echo "(4) Checking account balance"
    echo "(5) Withdraw cash from an account"
    echo "(6) Exit"
    echo "--> Please select an option between 1 and 6."
    read input
    case $input in
	1)
	    transfer saving
	    ;;
	2)
	    transfer checking
            ;;
	3)
	    bal saving
	    ;;
	4)
	    bal checking
	    ;;
	5)
	    withdraw
	    ;;
	6)
	    echo "Thank you for using the ATM system."
	    exit
    esac
done
