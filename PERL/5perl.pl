use 5.010;
say "what colour is the sky";
my $user_input = <STDIN>;
my $real_input = substr($user_input, 0,2);
if ( $real_input eq "Bl" || $real_input eq "bl" ) {
    print "The sky colour is $user_input";
} elsif ( $real_input eq "re" || $real_input eq "ye" ) {
    print "The sun is sometimes $user_input";
} else {
    print "color is not defined";
}

