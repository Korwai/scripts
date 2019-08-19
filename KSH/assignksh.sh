#!bin/ksh
print "*** Welcome to Cal Poly's ATM ***"
print "Please enter your PIN."
for (( i=0; i<3; i++ )); do
    read pin
    if (( $i == 2 )); then
        print "Too illegal PINs. Try again later."
        exit
    elif (( $pin != "111" )); then
        clear
        print "Invalid PIN. Please try again."
    else
        break
    fi
done
loop_c=0
checking=1000
saving=1000
function transfer {
    print "How much money would you like to transfer to your "$2" account?"
    read money
    if (( $2 == "saving" )); then
        if (( $checking - $money < 0 )); then
            print "Invalid transaction. You do not have the funds."
	    sleep 3
            return
        fi
        checking=`expr $checking - $money`
        saving=`expr $saving + $money`
	print "Your savings account balance is now: $"$saving
	sleep 3
    elif (( $2 == "checking" )); then
        if (( $saving - $money < 0 )); then
            print "Invalid transaction. You do not have the funds."
	    sleep 3
	    return
        fi
        saving=`expr $saving - $money`
        checking=`expr $checking + $money`
        print "Your checking account balance is now: $"$checking
	sleep 3
    fi
}
function bal {
    eval num='$'$1
    print "Your "$1" balance is now: $"$num;
    sleep 3
}
function withdraw {
    print "Which account would you like to withdraw from?"
    print "(1) Savings"
    print "(2) Checking"
    read account
    print "How much would you like to take out?"
    read take
    if (( $account == "1" )); then
        if (( $saving - $take < 0 )); then
            echo "Invalid transaction. You do not have the funds."
	    sleep 3
            return
        fi
        saving=`expr $saving - $take`
        print "Here is your "$take"."
        print "Your savings account balance is now: $"$saving
	sleep 3
    elif (( $account == "2" )); then
        if (( $checking - $take < 0 )); then
            echo "Invalid transaction. You do not have the funds."
	    sleep 3
            return
        fi
        checking=`expr $checking - $take`
        print "Here is your "$take"."
        print "Your checking account balance is now: $"$checking
	sleep 3
    else
	print "Invalid account. Please select an account."
	sleep 3
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
            transfer checking saving
            ;;
        2)
            transfer saving checking
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
	    print "Thank you for using the ATM service."
            exit
    esac
done
