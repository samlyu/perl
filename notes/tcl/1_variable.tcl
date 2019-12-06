#!/usr/bin/tclsh

if 0 {
this
is
comment
}

puts "Hello World";

# tcl only support string variables
set i 123;
set i hi;
set i "hi";
set i {hi};
set i "hi hello";		# use "" if whitespace exists
puts $i;			# print i
unset i;
set i a[set j b][set k c];
puts $i;			# print abc
puts $j;			# print b
puts $k;			# print c
unset i;unset j;unset k;

# string commands
string compare abc def;		# return 1 0 -1 according to ASCII
string match abc abc;		# return if match
string first abc abcdef;	# return string1's first position in string2, or -1 if not exists
string last abc aaaabc;		# return ... last ...
string trim abc__a__abc_bc abc;	# trim string1 in string2 from both sides
string tolower ABC;		# to lower cases
string toupper abc;		# to upper cases
string trimleft   aaa;		# trim left whitespaces
string length aaa;		# return length of string
set i a;
append i b c d;
puts $i;			# abcd

# number
set a 1;
incr a -3;
puts $a;			# a = -2

expr $a>0;
expr cos(0);

# list
set lis {abc {def {ghi jkl}}};
concat a {b c} {d {e f}};	# a b c d {e f}
lindex $lis 0;
llength $lis;
linsert $lis 1 hhh;		# listname index value1-n
lreplace $lis 1 1 sss;		# listname first_i last_i value1-n
lsort $lis;
lappend lis sss;		# not $lis here
lassign $lis yyy zzz;		# listname variable1-n
puts $yyy; puts $zzz; puts "***";
split adfasdf s;		# split string into a list

# array
set languages(0) tcl;
set languages(1) "python";
set languages(2) {perl};
puts $languages(1);
puts [array size languages];	# get array size
puts [array names perl];	# get array element index
set person(Name) "Sam";		# associative array
set person(Age) {23};
set d(1,1,1) hi;
set d(2,1,6) hello;
set d(0,0,3) 5;
parray d;			# print all elements of d
array name d;			# print indexes
array size d;			# print number of elements
array startsearch d;		# return a searchId handle, s-1-d, multiple Ids can search in parallel
array nextelement d s-1-d;	# return next elements (or nothing)
array anymore d s-1-d;		# return if anymore element exists
array donesearch d s-1-d;	# finish this search

# dict
dict set colors color1 red;
dict set colors color2 green;
puts $colors;
puts [dict size $colors];
puts [dict keys $colors];
puts [dict get $colors color2];
puts [dict exists $colors color3];
