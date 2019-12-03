#!/usr/bin/perl
# use strict;
# use warnings;

# Create reference
$foo = "Hello"; @arr=(1..5);
$scalarref = \$foo;
$constref = \186_282.42;
$arrayref = \@arr;
$arrRef = [1,2,3,4,5];

# Dereferencing
$var = 10;
$r = \$var;
print"Value of $var is $$r\n";
print ref($r), "\n";

@var = (10, 8, 5);
$r = \@var;
print"Value of @var is @$r\n";
print ref($r), "\n";

%var = (key1=>10, key2=>20);
$r = \%var;
print"Value of %var is %$r\n";
print ref($r), "\n";

$scalar = "Hello";
@scalar = ("Hello", "World", 123);
$refer = "scalar";
print("$$refer\n");	# $scalar
print("$$refer[1]\n");	# $scalar[0]

# Value of referenced variables
print("${$scalarref} \n");
print("${$constref} \n");
print("${$arrayref}[1] \n");
print("${$arrRef}[2] \n");

# Circular references
my $foo = 100;
$foo = \$foo;
print $$foo, "\n";

