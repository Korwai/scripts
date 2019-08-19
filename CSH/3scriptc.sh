#!bin/csh
echo "What was your score?"
set input = $<
switch($input) 
	case 100:
		echo "you got an A"
		breaksw
	case 9[0-9]:
		echo "you got an A"
		breaksw
	case 8[0-9]:
		echo "you got a B"
		breaksw
	case 7[0-9]:
		echo "You got a C"
		breaksw
	case 6[0-9]:
		echo "You got a D"
		breaksw
	case [1-5][0-9]:
		echo "You failed"
		breaksw
	case [0-9]:
		echo "You failed"
		breaksw
	default:
endsw
