echo Give me a number and I\'ll tell if it\'s even or odd!
read user_input
NUM=$(($user_input % 2))
if [ $NUM -eq 0 ]
	then
		echo It is even! 
	else
		echo It is odd!
fi
