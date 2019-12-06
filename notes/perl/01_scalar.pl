#!/usr/bin/perl
# use strict;
# use warnings;

## perl scalar $
# Numeric scalar
$data0 = 10;		# in perl all numbers are double
$data1 = 3.1415926;
$data2 = 2.18e22;
$data3 = 3_141_592_6;
$data4 = 0377;		# Octal
$data5 = 0xff;		# Hex
$data6 = 0b1101;	# Bin

# String scalar
$string0 = "Hello, World";		# ""==''
$string1 = " 'Hello, World' ";	# 'Hello, World'
$string2 = ' "Hello, World" ';	# "Hello, World"
$string3 = '\'Hello, World\'';	# 'Hello, World'
$string4 = "\"Hello, World\"";	# "Hello, World"

# Scalar operations (. + *)
my $str="12abc";
my $step = "3";
my $result1 = $str + $step;
my $result2 = $str . $step;
printf "$result1\t$result2\n";

# Multiline string
$string = '***This is
a multiline
string***';
printf "$string\n";

# Special literals
print "File name: " . __FILE__ . "\n";
print "Line name: " . __LINE__ . "\n";
print "Package name: " . __PACKAGE__ . "\n";

# global, private variable
sub g_print{
	print "$x\n";
}
sub test_my {
	my $x = 11;
	print "call-my $x\n";
	g_print;
}
sub test_local {
	local $x = 20;
	print "call-local $x\n";
	g_print;
}
$x = 9;
test_my;	# 11 9
test_local;	# 20 20
print "$x\n";	# 9

