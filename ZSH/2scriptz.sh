#!/bin/zsh
echo "Are you OK?"
read input
if [[ ${input[1]} = "Y" || ${input[1]} = "y" ]]
then
   echo "glad to hear it"
else [[ ${input[1]} = "N" || ${input[1]} = "n" ]]
   echo "sorry that you are not feeling so good"
fi
