#!bin/csh
echo "Give me a number and I will print if it is even or odd!"
set input = $<
if ($input % 2 == 0) then
	echo 'It is even!'
else
	echo 'It is odd!'
endif

