#!/bin/ksh
echo "Are you OK?"
read n
loop_c=true
while [ "$loop_c" = true ]
do
if [ $n == 'Y' ] || [ $n == 'y' ]; then
	echo "glad to hear it"
	loop_c=false
elif [ $n == 'N' ] || [ $n == 'n' ]; then
	echo "sorry that you are not feeling so good"
	loop_c=false
else
    echo "incorrect choice"
    loop_c=false
fi
done
