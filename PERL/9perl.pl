use 5.010;
sub do_square {
    $ans = $_[0] * $_[0];
    return $ans;
}
say do_square($ARGV[0]);
