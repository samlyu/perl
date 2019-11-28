#! /usr/bin/perl –w
use strict;
use warnings;

# sub 
# call function:
# &subname; sub subname{}

my $result = &add(1,2);
$result = $result + 1;
print "result = $result\n";
my $data = $result + &add(1,3);
print "data = $data\n";
sub add
{
	my @array = @_;
	my $val = 0;
	foreach my $item(@array)
	{
		$val = $val + $item;
	}
	return $val;	# all ignored after return
}

# call without &: predeclare or have () after sub
# call without (): predeclare
# do add(1,2);
# parameter passing:
sub add1
{
	my ($num1, $num2, $num3) = @_;	# need to follow the order
	my $val = $num1 + $num2 + $num3;
	return $val;
}

# use local in main, can be seen in local
# use reference:
sub sum
{
	my ($aref) = @_;
	my $total = 0;
	foreach(@$aref)
	{
		$total += $_;
	}
	return $total;
}
my @a = (1,2,3);
my $resulti = sum (\@a);
print "sum = $resulti\n";

