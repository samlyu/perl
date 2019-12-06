#!/usr/bin/tclsh

# regexp switch pattern string fullmatch submatch1-n

regexp {([A-Z,a-z]*).([A-Z,a-z]*)} "Tcl Tutorial" a b c;
puts "Full Match: $a";
puts "Sub Match1: $b";
puts "Sub Match2: $c";

regexp {([A-Z,a-z]*.([A-Z,a-z]*))} "Tcl Tutorial" a b c;
puts "Full Match: $a";
puts "Sub Match1: $b";
puts "Sub Match2: $c";

# switches:
# nocase: ignore case
# indices: store location instead of char
# line: ignore char after newline
# start index: set offset of start of search pattern
# -: end of switches

regexp -nocase { ( [A-Z]*.( [A-Z]* ) ) } "Tcl Tutorial" a b c;
puts "Full Match: $a";
puts "Sub Match1: $b";
puts "Sub Match2: $c";

regexp -nocase -line --  {([A-Z]*.([A-Z]*))} "Tcl \nTutorial" a b;
puts "Full Match: $a";
puts "Sub Match1: $b";

regexp -nocase -start 4 -line -- {([A-Z]*.([A-Z]*))} "Tcl \nTutorial" a b;
puts "Full Match: $a";
puts "Sub Match1: $b";
