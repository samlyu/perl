# eg:	check numbers in a string, if <2, output chars before first num
#		else, find chars between last 2 nums, switch U/L cases,
#		'a' 'b' 'd' to '0', except 'a' and 'd' in 'abcd'
my $varn = "we 2   test 3 this is 4 love what And abcd 5";
print("old string:\n$varn\n");
my $count = $varn=~tr/0-9/0-9/;
if($count<2)
{
	if($varn =~m/(.*)\d(.*)/)
	{
		print"left: $1\n";
	}
}
else
{
	if($varn =~m/(.*)(\d)(.*)(\d)(.*)/)	# greedy
	{
		my $a = $1;
		my $b = $2;
		my $string = $3;
		my $d = $4;
		my $e = $5;
		$string =~tr/a-zA-Z/A-Za-z/;
		$string =~s/a(?!bcd)/0/;	# not change a in abcd
		$string =~s/(?!abc)d/0/;	# not change d in abcd
		$varn = $a.$b.$string.$d.$e;
		print("new string:\n$varn\n");
	}
}
