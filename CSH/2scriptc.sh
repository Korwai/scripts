#!bin/csh
echo "Are you okay?"
set input = $<
if ($input == 'Y' || $input == 'y') then
	echo "glad to hear it"
else if ($input == 'N' || $input == 'n') then
	echo "sorry that you are not feeling good"
else
	echo "Incorrect choice. Please try again."
endif
