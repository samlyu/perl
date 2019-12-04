#!/usr/bin/tclsh

# decisions
if {2>1} {
	puts a
} else {
	puts b
}

set grade A;
switch $grade {
	A {puts "Well done!";}
	B {puts "Not too bad.";}
	C {puts "passed";}
	default {puts "invalud grade";}
}

# loops
foreach i {0 3 2 1} {
	switch $i {
		1 {puts 111}
		2 {puts 222}
		3 {puts 333}
		default {puts xxx}
	}
}

for {set i 0} {$i < 5} {incr i} {
	puts $i
}

# proc
proc helloworld {} {
	puts "Hello world!";
}
helloworld;

proc add {a b} {
	return [expr $a+$b];
}
puts [add 10 30];

proc mul {a {b 3}} {		;# with default argument
	return [expr $a*$b];
}
puts [mul 3];

proc factorial {number} {	;# recursive procedure
	if {$number <= 1} {
		return 1
	}
	return [expr $number * [factorial [expr $number - 1]]];
}
puts [factorial 3];
puts [factorial 5];

# io
format "%s %d" hello 666
scan 12.34.56.78 %d.%d.%d.%d a b c d

set f [open test.txt w]
puts -nonewline $f "hello\n"
puts $f "world"
close $f
