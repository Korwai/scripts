#!bin/csh
echo "give me a colour!"
set input = $<
set in = `echo $input | cut -c1-2`
if ($in == 'Bl' || $in == 'bl') then
	echo "The sky colour is $input"
else if ($input == "red" || $input == "yellow") then
	echo "The sun is sometimes $input"
else 
	echo "color is not defined"
endif
