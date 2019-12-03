#!/usr/bin/perl
use strict;
use warnings;
# hash: key & value
# $student @student %student not relevant
my %hash_A = ();	# empty hash
%hash_A = ("key1", 1, "key2", 2);
%hash_A = ("key1"=>1, "key2"=>2);
%hash_A = (key1=>1, key2=>2);
$hash_A{"key1"} = 1;

%hash_A = (food=>"fruit", thing=>"book");
my %hash_B = (
			fruit=>{round=>"apple",
					round2=>"pear",
				},
			book=>{red=>"king of the queen",
					green=>"the forest",
				}
			);
my %hash_C = %hash_B;
printf("the food is: $hash_A{food}\n");
printf("the target is: $hash_C{$hash_A{food}}{round}\n");

delete($hash_C{'book'}{'green'});
printf("$hash_C{$hash_A{thing}}{red}\n");

my %hash_D = (123=>"fruit","123"=>"book");
printf("the target is: $hash_D{123}\n");	# always return "123"'s value

# slice
my @array = @hash_A{"thing","food"};
printf"@array\n";

%hash_D = (%hash_B, %hash_A);
foreach my $key(keys %hash_D)
{
	printf"$key => ";
	printf"$hash_D{$key}\n";
}

# exist
my %hash_E = ("case1"=> ,"case2"=> ,"case3"=>1);	# empty values
my $flag = exists $hash_E{"case1"};
printf("$flag\n");

# each
my @array1 = each(%hash_A);		# get a key value pair
foreach my $value1(@array1)
{
	printf"$value1 ";
}printf"\n";

# ENV
my ($key, $value)=each %ENV;
printf"key: $key => value: $value\n";

# reverse (key <-> value)
%hash_A = reverse %hash_A;
foreach my $key (keys %hash_A)
{
	printf"key: $key: ";
	printf"value: $hash_A{$key}\n";
}

# keys an array return all keys (next level, no order)
foreach my $key (keys %hash_B)
{
	foreach my $key1(keys %{$hash_B{$key}})
	{
		printf"key1: $key1\t";
		printf"value: $hash_B{$key}{$key1}\n";
	}
}

# get the length of hash_A
my $len_A = keys %hash_A;
printf"$len_A\n";

# sort
my %hash_class = (
	C => {
		1 => 98,
		4 => 76,
	},
	E => {
		5 => 97,
		2 => 41,
	},
	A => {
		6 => 77,
		3 => 84,
	}
);
printf"sort by key:\n";
foreach my $key(sort{$a cmp $b} keys %hash_class)
{
	foreach $_(sort{$a <=> $b} keys %{$hash_class{$key}})
	{
		printf"$key => $_ => ";
		printf"$hash_class{$key}{$_}\n";
	}
}
printf"sort by value:\n";
%hash_class = (forest=>99,cristine=>98,leon=>100,crystal=>59,amy=>58);
foreach (sort{$hash_class{$a} <=> $hash_class{$b}} keys %hash_class)
{
	printf"$_ => ";
	printf"$hash_class{$_}\n";
}

# reference
my $href = \%hash_A;
my $aref = $href;
my $href1 = {key1=>'abc',key2=>'abcd'};
# %{$href} = %hash_A;
printf"$href->{fruit}\n";
