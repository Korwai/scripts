#!/bin/zsh
echo "what colour is the sky"
read input
TWO=`echo $input | cut -c1-2`
case $TWO in
    (Bl | bl)
        echo "The sky colour is $input"
	;;
    (re | ye)
        echo "The sun is sometimes $input"
	;;
    (*)
        echo "color is not defined"
	;;
esac
