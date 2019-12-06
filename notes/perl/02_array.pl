#!/usr/bin/perl
# use strict;
# use warnings;

## perl array @

# Create array
@array0 = ("string1", 1.5, 418);
@array0 = qw(string1 string2 string3);	# do not need quotation marks
$test1 = "Hello";
@array1 = ("World", 123);
@array2 = ($test1, @array1, "How are you");	# "Hello", "World", "123", "How are you"

# Access elements
printf "$array2[3]\n";
printf "$array2[-1]\n";
$array2[0] = 8;			# use index
$end = $#array2;		# $# => index of the last element
$last = $array2[-1];		# [-1] => last element

# Sequential number array
@array3 = (5..9);		# 5, 6, 7, 8, 9
@array4 = (a..f);		# a, b, c, d, e, f
printf "@array3\t@array4\n";

# Array size
$size3 = @array3;
$size4 = @array4;
printf "$size3\t$size4\n";

# Adding and removing elements
$test1 = pop(@array3);		# $test1=9, @array3 = 5 6 7 8
push(@array3, 8);		# array3 = 5 6 7 8 8
push(@array3, 1..5);		# array3 = 5 6 7 8 8 1 2 3 4 5
@array5 = (5..9);
$test1 = shift(@array5);	# $test1 = 5, array5 = 6 7 8 9
unshift(@array5, 8);		# array5 = 8 6 7 8 9

# Slicing array
@array6 = @array5[2,4];
printf "@array6\n";

# Replacing elements
@array7 = (1..20);
printf "@array7\n";
splice(@array7, 12, 5, 5..9);	# splice(@array, offset, length, list)
printf "@array7\n";

# String <-> array
$var_string = "a-b-c-d-e-f-g";
@array8 = split('-', $var_string);
$var_string2 = join(',', @array8);
printf "@array8\n";
printf "$var_string2\n";

# Sort array
@array7 = sort(@array7);	# sort according to ASCII
printf "@array7\n";

# Merge array
@array9 = (@array8, @array7);
printf "@array9\n";
