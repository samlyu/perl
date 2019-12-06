#!/bin/bash
### GREP and TR notes and examples

### GREP
## grep [option] "string" text_file
## Regex mode
# -G: grep
# -E: egrep
# -P: perl

## Control
# -f FILE: pattern from FILE
# -i: ignore case
# -v: select non mathing lines
# -w: whole word
# -x: whole line
# -a: handle bin as text

## Output
# -c: print match count
# --color: print with highlighted matched pattern
# -o: print only matched parts

# match with highlight and line number, case-insensitive
grep -b -n --color -i "this" test.txt

# match with same start and ending
grep -n --color -i ".*is" test.txt

### TR
## tr [command] [SET1] [SET2]
## Commands
# -c: complement
# -d: delete
# -s: sqeeze continuous repeated strings into one string
# -t: truncate SET1 so it has the same length as SET2

## SET options
# [:alnum:] all letters and numbers
# [:alpha:] all letters
# [:cntrl:] all control chars
# [:digit:] all numbers
# [:graph:] all printable chars (no whitespaces)
# [:print:] all printable chars (with whitespaces)
# [:lower:] all lowercase letters
# [:upper:] all uppercase letters
# [:punct:] all punctuations
# [:xdigit:] all hex numbers
# [=CHAR=] any specified CHAR

cat test.txt | tr [:lower:] [:upper:]
