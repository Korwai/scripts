use 5.010;
my $low = $ARGV[0];
my $high = $ARGV[1];
if ( $low < $high ) {
    say $low;
} elsif ( $high < $low ) {
    say $high;
    $high = $ARGV[0];
    $low = $ARGV[1];
} else {
    say "They are equal.";
}
for $i (1 .. $low) {
    if ( $low % $i == 0 && $high % $i == 0 ) {
	$GCD=$i;
    }
}
say $GCD;
my $num=$low * $high;
my $num2 = $num / $GCD;
say $num2;
