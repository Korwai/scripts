#!/usr/local/bin/perl
use 5.010;
my $score = $ARGV[0];
chomp $score;
if ( $score <= 100 && $score >= 90 ) {
    say "You got A";
}
elsif ( $score <= 89 && $score >= 80 ) {
    say "You got B";
}
elsif ( $score <= 79 && $score >= 70 ) {
    say "You got C";
}
elsif ( $score <= 69 && $score >= 60 ) {
    say "You got D";
}
elsif ( $score <= 59 && $score >= 0 ) {
    say "You fail";
}
else {
    say "not a real score";
}

