#!/bin/sh

if [ $# -lt 3 ]; then
    echo "Invalid parameter count"
fi

operation=$1

if [ "$operation" != "add" ]   && 
[ "$operation" != "subtract" ] && 
[ "$operation" != "multiply" ] && 
[ "$operation" != "divide" ] ; 
then
    echo "no such operation: $operation"
fi

shift 1
firstOperand=$1
shift 1

numbers=""
while [ $# -gt 0 ]
do
    numbers="${numbers} $1"
    shift 1
done


result=$firstOperand
case $operation in
"add")
    for number in ${numbers}; do
        result=$(( $result + $number ))
    done
    ;;
"subract")
    for number in ${numbers}; do
        result=$(( $result - $number ))
    done
    ;;
"multiply")
    for number in ${numbers}; do
        result=$(( $result * $number ))
    done
    ;;
"divide")
    for number in ${numbers}; do
        if [ $number -eq "0" ] ; then
            echo "division by 0"
            exit
        fi

        result=$(( $result / $number ))
    done
    ;;
esac

echo $result