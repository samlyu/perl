@array = ("string1", 1.5, 418);
@array = qw(string1 string2 string3);	# do not need quotation marks
$test1 = "Hello";
@array1 = ("World", 123);
@array2 = ($test1, @array1, "How are you");	# "Hello", "World", "123", "How are you"
@array = (5..9);		# 5, 6, 7, 8, 9
$test1 = pop(@array);	# $test1=9, @array = 5 6 7 8
push(@array, 8);		# array = 5 6 7 8 8
push(@array, 1..5);		# array = 5 6 7 8 8 1 2 3 4 5
@array2 = (5..9);
$test1 = shift(@array);	# $test1 = 5, array = 6 7 8 9
unshift(@array, 8);		# array = 8 6 7 8 9
$array[0] = 8;			# index
$end = $#array;			# $# => index of the last element
$last = $array[-1];		# [-1] => last element
