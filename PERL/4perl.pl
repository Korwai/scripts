use 5.010;
my $date = `date`;
my @dates = split(' ', $date);
for $i (0 .. $#dates) {
    say $dates[$i];
}
