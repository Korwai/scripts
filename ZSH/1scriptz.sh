#!/bin/zsh
echo "Give me a number and I'll print if it's even or odd!"
read input
if (( $input % 2 == 0 )) then
   echo "It is even!"
else
   echo "It is odd!"
fi
