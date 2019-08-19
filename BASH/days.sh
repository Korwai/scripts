#!/bin/ksh
lim=$#
echo $lim
for ((i = 1; i <= $lim; i++)); do
	for ((j = $i; j <= $lim; j++)); do
		eval y='$'$j
		echo -n $y
		echo -n " "
	done
echo ""
done
