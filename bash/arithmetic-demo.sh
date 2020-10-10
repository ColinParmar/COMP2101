#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

firstnum="Enter first number: "
read -p "$firstnum" usernumber1
secondnum="Enter second number: "
read -p "$secondnum" usernumber2
thirdnum="Enter third number: "
read -p "$thirdnum" usernumber3

sum=$(( usernumber1 + usernumber2 + usernumber3 ))
product=$(( usernumber1 * usernumber2 * usernumber3 ))
echo "The sum of the 3 usernumbers is $sum"
echo "The product of the 3 usernumbers is $product"
#sum=$((firstnum + secondnum))
#dividend=$((firstnum / secondnum))
#fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstnum/$secondnum}")

#cat <<EOF
#$firstnum plus $secondnum is $sum
#$firstnum divided by $secondnum is $dividend
#  - More precisely, it is $fpdividend
#EOF
