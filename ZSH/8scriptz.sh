#!/bin/zsh
low=$1
high=$2
if [[ $low -lt $high ]]
then
      echo $low
elif [[ $high -lt $low ]]
then
      echo $high
      high=$1
      low=$2
else
      echo "They are equal."
fi
for (( i=1; i<=$low; i++ ))
do
    if (( $low % $i == 0 )) && (( $high % $i == 0 )); then
           GCD=$i
    fi
done
echo $GCD
num=`expr $low \* $high`
echo `expr $num / $GCD`
