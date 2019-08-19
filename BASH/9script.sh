#!/bin/ksh
function do_square() {
	sq=`expr $1 \* $1`
}
do_square $1
echo $sq

