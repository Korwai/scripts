echo "Give me a number between 1 and 10."
read user_input
sum=0
product=1
for (( i = 1; i <= $user_input; i++)); do
        sum=`expr $sum + $i`
done
for (( j = 1; j <= $user_input; j++)); do
        product=`expr $product \* $j`
done
echo $sum
echo $product
