#!/usr/bin/perl
use strict;
use warnings;
my @array = (1,2,3..50,55,60,43,32,82..99);
my $length_array = @array;
for(my $i=0;$i<$length_array;$i++)
{
	if($array[$i]<60)
	{
		print("item $i, value is: $array[$i]\n");
		next;		# to end of this iteration, start next iteration
		print("nothing\n");
	}
	else
	{
		print("item $i, value is: $array[$i], greater than 60.\n");
		last;		# to end of iterator, end loop
	}
}


foreach my $item (@array) 	# foreach has no order, use sort{$a <=> $b}@array
{
	if($item>60)
	{
		print("$item\n");
	}
	$item = 150;			# change @array
}
print("--test--\n");
foreach my $item (@array)
{
	print("$item\n");
}

# default variable
foreach (@array)
{
	if($_ > 60)
	{
		print("$_");	# same as printf;
	}
}
printf("\n");


# unless = !if, until = !while
until (-e "05_control.pl")
{
	printf("begin to sleep\n");
	sleep(1);
}
continue				# also execute when no "05_control.pl"
{
	printf("waiting for update\n");
}
