use 5.010;
say "Give me a number between 1 and 10.";
$user_input = <STDIN>;
chomp $user_input;
$sum = 0;
$product = 1;
for $i (1 .. $user_input) {
    $sum = $sum + $i;
    $product = $product * $i;
}
say $sum;
say $product;
