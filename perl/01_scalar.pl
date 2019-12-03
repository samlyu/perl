#!/usr/bin/perl
# use strict;
# use warnings;
$data0 = 10;		# in perl all numbers are double
$data1 = 3.1415926;
$data2 = 2.18e22;
$data3 = 3_141_592_6;
$data4 = 0377;		# Octal
$data5 = 0xff;		# Hex
$data6 = 0b1101;	# Bin

$string0 = "Hello, World";		# ""==''
$string1 = " 'Hello, World' ";	# 'Hello, World'
$string2 = ' "Hello, World" ';	# "Hello, World"
$string3 = '\'Hello, World\'';	# 'Hello, World'
$string4 = "\"Hello, World\"";	# "Hello, World"
# esc char only works in ""

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

