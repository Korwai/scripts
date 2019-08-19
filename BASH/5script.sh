#!/bin/bash
echo "what colour is the sky"
read user_input
TWO=`echo $user_input | cut -c1-2`
if [ "$TWO" == "Bl" ] || [ "$TWO" == "bl" ]
then
	echo "The sky colour is $user_input"
elif [ $user_input == "red" ] || [ $user_input == "yellow" ]
then
	echo "The sun is sometimes $user_input"
else
	echo "color is not defined" 
fi
