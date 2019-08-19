#!bin/csh
set loop = 1
set first = $1
set second = $2
while ( $loop == 1 )
echo "Add the numbers (enter a or A)"
echo "Subtract the numbers (enter s or S)"
echo "Multiply the numbers (enter m or M)"
echo "Divide the numbers (enter d or D)"
echo "Exit (select e or E)"
set input = $<
switch ($input)
        case [Aa]: 
                @ num = $first + $second
		echo $num
                breaksw
        case [Ss]:
                @ num = $first - $second
		echo $num
                breaksw
        case [Mm]:
                @ num =  $first * $second
		echo $num
                breaksw
        case [Dd]:
                @ num = $first / $second
		echo $num
                breaksw
        case [Ee]:
                loop = 0
                breaksw
        case *:
                echo "Select an option."
                continue
endsw
echo "Want to do another operation? [ Y | N ]"
set input = $<
if ( $input == 'Y') then
        echo "Would you like to use the same integers? [ Y | N ]"
        set input = $<
        if ( $input == 'Y' ) then
                continue
        else if ( $input == 'N' ) then
                echo "Type in two new integers."
                set first = $<
                set second = $<
        endif
else
        set loop = 0
endif
end

