#!/bin/bash
echo "Hello World!"

## string
# new a variable and print
var="123"
echo $var
# list files in directory
for file in $(ls /home/shengwei); do
	echo "file name:${file}"
done
# concatenate
e1="hello, "$var" !"
e2="hello, $var !"
echo $e1 $e2
e3='hello, '$var' !'
e4='hello, $var !' 
echo $e3 $e4
# length
echo ${#e4}
# substring
echo ${e4:0:6}
# index of substring
echo `expr index "$e4" ,`

## array
a1=(v0 v1 v2)
echo ${a1[@]}
echo ${a1[1]}
# length
length=${#a1[@]}
length1=${#a1[1]}
echo $length $length1
# comments
: '
com
ments
'
<<'COMMENT'
com
ments
COMMENT

## parameter passing
echo "$0: number of params: $#"

for i in "$@"; do
	echo $i
done

## expr
a=10
b=20
# + - \* / %
echo "`expr $a + $b`"
echo "`expr $a \* $b`"
# -eq -ne -gt -lt -ge -le
if [ $a -eq $b ]
then
	echo "a == b"
else
	echo "a != b"
fi
# ! -o -a
if [ $a -lt 100 -a $b -gt 15 ]
then
	echo "a<100 and b>15"
fi

## echo
echo "echo test"
echo echo test
echo "\"echo test\""
echo -e "line1\nline2"
echo -e "line3\c"
echo line3
# display command result
echo `ls`

## if
num1=$[2*3]
num2=$[1+5]
if test $[num1] -eq $[num2]
then
	echo 'num1==num2'
else
	echo 'num1!=num2'
fi

for loop in 1 2 3 4 5
do
	echo -e "$loop \c"
done

int=1
while(($int<=5))
do 
	echo -e $int "\c"
	let "int++"
done
echo "EOF"