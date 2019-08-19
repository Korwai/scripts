use v5.010;
say "Are you OK?";
my $rep = <STDIN>;
chomp $rep;
if ( $rep eq "Y" || $rep eq "y" ) {
    say "glad to hear it";
} elsif ( $rep eq "N" || $rep eq "n" ) {
    say "sorry that you aren\'t doing so good";
} else {
    say "Invalid response.";
}
