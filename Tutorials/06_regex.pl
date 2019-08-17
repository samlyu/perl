use strict;
use warnings;

# regular expressions only apply to scalars
$_ = "Hello World";
if(/World/){printf("match\n")};

$_ = "the file is in /mnt/f/perl";
if(/\/mnt\/f\/perl/){printf("match\n")};	# has / in the string, use \/

if(/\p{Space}/){printf("has whitespace\n")};
if(/\p{Digit}/){printf("has number\n")};
if(/\p{Hex}\p{Hex}/){printf("has a pair of hex\n")};
if(/\P{Space}/){printf("has not-whitespace chars\n")};

$_ = "Hello Worldd";
if(/World+/){printf("match\n")};	# 1 or many Worlddddd...
if(/(World)+/){printf("match\n")};	# 1 or many WorldWorld...

# grouping
$_ = "HelloWorldHelloWorldWorld";
if(/(Hello)(World)\1\2/){printf("match_1\n")};
if(/(Hello)(World)\2/){printf("match_2\n")};

$_ = "HelloWorld";
if(/Hello(|my)World/){printf("match_3\n")};

# metacharacter
# .			: everything except \n
# a-z 0-9	: any single char of these
# ^a-z 0-9	: any single char not of these
# \d		: single num
# \D		: single not num
# \w		: any word or underscore
# \W		: any not word or underscore
# \s		: whitespace tab enter
# \n \r \t	: wrap enter tab
# \b		: boundary
# ^			: beginning of line
# $			: end of line
# \A \z		: char only at the beginnning end
# \Z		: char at end or before newline
# x?		: 0 or 1 x
# x*		: 0 or many x
# x+		: 1 or many x
# x{m,n}	: m to n x
# (a|b|c)	: a or b or c
# \12		: Octal
# \x12		: Hex
# \e		: ASCII

# m// or // or m??
my $string = "This string contains the number 25.11";
my $test = $string =~/~?(\d+)\.?(\d+)/;
print($string."\n");
print($test."\n");
my $integerpart = $1;
my $decimalpart = $2;
print $integerpart."\n";
print $decimalpart."\n";
print $0."\n";

# g		: return all matched pattern
# i		: ignore upper/lower case
# s		: see as one line
# x		: ignore whitespace
my @matches = "balata" =~/.a/g;
foreach my $item(@matches)
{
	print("$item\n");
}


# pattern replacement s//
# e		: not string but expression

my $var1 = "0abc1";
$var1 =~s/[a-zA-Z]+/3*2/e;
print $var1."\n";
$var1 = "0abc1";
$var1 =~s/[a-zA-Z]+/3*2/;
print $var1."\n";


# pattern transform tr//
my $var2 = "abcdfghicba";
print $var2."\n";
my $result = $var2 =~tr/abc/def/;	# a->d, b->e, c->f
print $var2."\n";
print $result."\n";
$var2 =~tr/defg/DEF/;				# d->D, e->E, f->F, g->F
print $var2."\n";
# to count numbers: $str =~tr/0-9/0-9/;
# c	: transform all unnamed char
# s	: delete named char
# d	: same chars to 1 char
my $var3 = "12abc3abc";
$var3 =~tr/0-9/ /cs;
print $var3."\n";

my $var4 = "string1 string2";
my $var5 = "def";
$var4 =~s/$var4/$var5/;	# replace whole $var4 to $var5
print $var4."\n";

my $var6 = "word1word2word2word1";
$var6 =~s/(word1)(word2)/$2$1/;	# word1 word2 swap
print $var6."\n";

# ?: ?= ?!
my $var7 = "industry";
if($var7 =~m/indus(?=try|tries)/)	# industry or industries
{
	print "match: $var7\n";
}
my @var8 = ("Windows7","Windows8","WindowsXP");
foreach my $item2(@var8)
{
	if($item2 =~m/Windows(?=95|98|XP|7)/)
	{
		$item2 =~s/Windows(?=95|98|XP|7)/system/;
		print $item2."\n";
	}
	else
	{
		print "doesn't match\n";
	}
}