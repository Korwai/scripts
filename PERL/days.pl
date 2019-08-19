use 5.010;
$a = 0;
$b = $#ARGV+1;
until ($b == 0) {
    $a = 0;
    until ($a == $b) {
	print $ARGV[$a] . " ";
	$a++;
    }
    $b--;
    say " ";
}
