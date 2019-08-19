loop=true
first=$1
second=$2
while [ $loop = true ]
do
    echo $first
    echo $second
echo "Add the numbers (enter a or A)"
echo "Subtract the numbers (enter s or S)"
echo "Multiply the numbers (enter m or M)"
echo "Divide the numbers (enter d or D)"
echo "Exit (select e or E)"
read input
case $input in
	[Aa])
		echo `expr $first + $second`
		;;
	[Ss])
		echo `expr $first - $second`
		;;
	[Mm])
		echo `expr $first \* $second`
		;;
	[Dd])
		echo `expr $first / $second`
		;;
	[Ee])
		loop=false
		break
		;;
	*)
		echo "Select an option."
		continue
esac
echo "Want to do another operation? [ Y | N ]"
read user_input
if [ $user_input = 'Y' ]
then
	echo "Would you like to use the same integers? [ Y | N ]"
	read u_input
	if [ $u_input = 'Y' ]
	then
		continue
	elif [ $u_input = 'N' ]
	then

	    echo "Type in two new integers."
	    echo "Type in the first integer."
	    unset first
	    unset second
	        read in1
		first=$in1
		echo "Type in the second integer."
		read in2
		second=$in2
	fi
else
	loop=false
fi
done

