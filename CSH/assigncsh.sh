#!/bin/csh
echo "*** Welcome to Cal Poly's ATM ***"
echo "Please enter your PIN."
set i = 0
while ( $i < 3 )
    set pin = $<
    if ($i > 2) then
        echo "Too illegal PINs. Try again later."
        exit
    else if ($pin != "111") then
        clear
        echo "Invalid PIN. Please try again."
    else
        break
    endif
    @ i++;
end
set loop_c=0
set checking=1000
set saving=1000
while ( $loop_c != 1 )
    clear
    echo "*** Welcome to Cal Poly's ATM ***"
    echo "(1) Transfer from checking account to savings account"
    echo "(2) Transfer from savings account to checking account"
    echo "(3) Savings account balance"
    echo "(4) Checking account balance"
    echo "(5) Withdraw cash from an account"
    echo "(6) Exit"
    echo "--> Please select an option between 1 and 6."
    set input = $<
    switch($input)
        case 1:
	    echo "How much money would you like to transfer?"
	    set money = $<
            if ( ($checking - $money) < 0 ) then
		echo "Invalid transaction. You do not have the funds."
		echo 'Your current balance in your checking account is: $'$checking
		sleep 3
                continue
	    endif
	    @ checking = $checking - $money
	    @ saving = $saving + $money
	    echo 'Your savings account balance is now: $'$saving
	    sleep 3
            breaksw
        case 2:
	    echo "How much money would you like to transfer?"
            set money = $<
	    if ( ($saving - $money) < 0 ) then
		echo "Invalid transaction. You do not have the funds."
	        echo 'Your current balance in your savings account is: $'$saving
		sleep 3
		continue
	    endif
	    @ saving = $saving - $money
	    @ checking = $checking + $money
	    echo 'Your checking account balance is now: $'$checking
	    sleep 3
	    breaksw
        case 3:
	    echo 'Your savings balance is now: $'$saving
	    sleep 3
            breaksw
        case 4:
	    echo 'Your checking balance is now: $'$checking
	    sleep 3
	    breaksw
        case 5:
            echo "Which account would you like to withdraw from?"
	    echo "(1) Savings"
	    echo "(2) Checking"
	    set account = $<
	    echo "How much would you like to take out?"
	    set take = $<
	    switch($account)
		case 1:
		    if ( ($saving - $take) < 0 ) then
			echo "Invalid transaction. You do not have the funds."
			echo 'Your current balance in your savings account is: $'$saving
			sleep 3
			continue
		    endif
		    @ saving = $saving - $take
		    echo 'Here is your $'$take"."
		    echo 'Your savings account balance is now: $'$saving
		    sleep 3
		    breaksw
		case 2:
		    if ( ($checking - $take) < 0 ) then
			echo "Invalid transaction. You do not have the funds."
			echo 'Your current balance in your checking account is: $'$checking
			sleep 3
			continue
		    endif
		    @ checking = $checking - $take
		    echo 'Here is your $'$take"."
		    echo 'Your checking account balance is now: $'$checking
		    sleep 3
		    breaksw
		case *:
		    echo "Invalid account. Please pick an account."
		    sleep 2
		    continue
		    breaksw
	   endsw
	   breaksw
        case 6:
	    echo "Thank you for using the ATM system."
            set loop_c = 1
    endsw
end
