#!bin/csh
echo 'Give me a number between 1 and 10.'
set input = $<
@ sum = 0
@ product = 1
while ( $input >= 1 )
	@ sum = $sum + $input
	@ product = $product * $input
	@ input = $input - 1
end
echo $sum
echo $product
