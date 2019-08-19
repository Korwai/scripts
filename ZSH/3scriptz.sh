#!/bin/zsh
echo "What was your score?"
read score
case $score in
    (9[0-9] | 100)
	echo "you got A"
	;;
    (8[0-9])
	echo "you got B"
	;;
    (7[0-9])
	echo "you got C"
	;;
    (6[0-9])
	echo "you got D"
	;;
    ([1-5][0-9] | [0-9])
	echo "you failed"
	;;
esac
