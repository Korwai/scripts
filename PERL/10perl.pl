use 5.010;
$loop = 0;
$first = $ARGV[0];
$second = $ARGV[1];
while ( $loop == 0 ) {
    say $first;
    say $second;
    say "Add the numbers (enter a or A)";
    say "Subtract the numbers (enter s or S)";
    say "Multiply the numbers (enter m or M)";
    say "Divide the numbers (enter d or D)";
    say "Exit (select e or E)";
    my $input = <STDIN>;
    chomp $input;
    if ( $input eq "A" || $input eq "a" ) {
	say $first + $second;
    } elsif  ( $input eq "S" || $input eq "s" ) {
	say $first - $second;
    } elsif  ( $input eq "M" || $input eq "m" ) {
	say $first * $second;
    } elsif  ( $input eq "D" || $input eq "d" ) {
	say $first / $second;
    } elsif  ( $input eq "E" || $input eq "e" ) {
	$loop = 1;
	last;
    } else {
	say "Please select a proper option.";
	next;
    }
    say "Want to do another operation? [ Y | N ]";
    $user_input = <STDIN>;
    chomp $user_input;
    if ( $user_input eq "Y" ) {
        say "Would you like to use the same integers? [ Y | N ]";
        $u_input = <STDIN>;
	chomp $u_input;
        if ( $u_input eq "Y" ) {
	    next;
        } elsif ( $u_input eq "N" ) {
            say "Type in the first integer.";
	    $first = <STDIN>;
	    chomp $first;
            say "Type in the second integer.";
            $second = <STDIN>;
	    chomp $second;
        }
    } else {
	$loop = 1;
    }
}
