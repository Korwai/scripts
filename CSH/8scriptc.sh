#!bin/csh
set low = $1
set high = $2
if ( $low < $high ) then
        echo $low
else if ( $high < $low ) then
        echo $high
        high = $1
        low = $2
else
        echo "They are equal."
endif
set i = 1
while ( $i <= $low ) 
	if ( $low % $i == 0 && $high % $i == 0 ) then
		set GCD = $i
	endif
	@ i++
end
echo $GCD
@ num = ($low * $high) / $GCD
echo $num

