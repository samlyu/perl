@array0 = ("string1", 1.5, 418);
@array0 = qw(string1 string2 string3);	# do not need quotation marks
$test1 = "Hello";
@array1 = ("World", 123);
@array2 = ($test1, @array1, "How are you");	# "Hello", "World", "123", "How are you"
@array3 = (5..9);			# 5, 6, 7, 8, 9
$test1 = pop(@array3);		# $test1=9, @array3 = 5 6 7 8
push(@array3, 8);			# array3 = 5 6 7 8 8
push(@array3, 1..5);		# array3 = 5 6 7 8 8 1 2 3 4 5
@array4 = (5..9);
$test1 = shift(@array4);	# $test1 = 5, array4 = 6 7 8 9
unshift(@array4, 8);		# array = 8 6 7 8 9
$array4[0] = 8;				# use index
$end = $#array4;			# $# => index of the last element
$last = $array4[-1];		# [-1] => last element
