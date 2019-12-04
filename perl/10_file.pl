#!/usr/bin/perl
use strict;
use warnings;

# STDIN: input, STDOUT: output, STDERR: error
print "input data: \n";
my $data = <STDIN>;
print STDOUT "The data is $data";

# open(file, path);
if (open (MYFILE, "10_file.pl"))
{
	print "success\n";
}
else
{
	print "cannot open file\n";
	exit 1;
}
# open(file, path) or die;
# open (MYFILE, "11_file.pl") or die "not exists: $!\n";
# warn: print warning, not terminate program
if(!open (MYFILE, "10_file.pl"))
{
	warn "cannot open file: $!";
}print "another command here\n";

# <read one line>
open (MYFILE, "pl_test.txt") or die "cannnot open test file:$!\n";
while(my $line = <MYFILE>)
{
	print "$line";
}print "\n";
close MYFILE;

open (MYFILE, "pl_test.txt") or die "cannnot open test file:$!\n";
my @array = <MYFILE>;
print @array;
print "\n";
close MYFILE;

open (MYFILE, ">>pl_test.txt");	# add >>, overwrite >
print MYFILE "\nline3\n";
close MYFILE;

open (MYFILE, "pl_test.txt");
my @array = <MYFILE>;
print @array;
close MYFILE;

# file test
# -r 'file': return if readable
# -w $file: return if writeable
# -e 'file': return if exist
# -z 'file': return if exist and empty
# -s 'file': return size (num of chars) if exist
# -f 'a.txt': return if is a normal file
# -d '/tmp': return if is a directory
# -T 'data': return if data is a text file
# -B 'data': return is data is a bin file
# -M 'data': return num of days after 'data' was modified

# < read only access
# > write truncate
# >> write append
# +< read and write
# +> read write truncate
# +>> read write append
