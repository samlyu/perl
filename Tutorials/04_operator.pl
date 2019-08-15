# arithmetic
# + - * /
# strings:
use warnings;
my $string1 = "abc3";
my $string2 = "3abc";
my $string3 = "30abc2";
my $number1 = 5;
my $result1 = $string1 + $number1;	# from left to right, if not 0~9, discard right part
my $result2 = $string2 + $number1;
my $result3 = $string3 + $number1;
print("$result1 \n");	# 5
print("$result2 \n");	# 8
print("$result3 \n");	# 35
# exponential **
$test=(-5)**2.5;
print("$test\n");		# NaN
# mod %
($data1, $data2)=(18,4);
$data3 = $data1 % $data2;
print("$data3\n");
# self reduction
$data4 = -5;
$data5 = --$data4;		# both -6 (--left instant -1, --right, return self, next -1)
print("$data4\n$data5\n");
# string abz + 1 = aca (carry)
# string compare: gt ge lt le eq ne cmp (base on ASCII, A<a)
# bitwise vs logical:
my $data1 = 0b100_100;
my $data2 = 0b011_110;
if($data1 && $data2)
{
	print("not all zero\n");
}
my $data3 = $data1 & $data2;
print("$data3\n");
# assign
$data1 = $data2 = $dat3 = "string";
# others
$test1 = "begin";
$test2 = $test1."here";
$test3 = $test2 x 2;
print("$test3\n");
$condvar=43;
$condvar==43? $var1 = 14 : $var2 = 14;
