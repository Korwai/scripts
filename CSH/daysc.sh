#!bin/csh
set i = 1
set j = 1
@ lim = $#argv
echo $lim
while ( $i <= $lim )
	@ j = $i
	while ( $j <= $lim )
		echo -n $argv[$j]
		echo -n " "
		@ j = $j + 1
	end
	@ i = $i + 1
	echo ""
end
