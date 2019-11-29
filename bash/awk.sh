#!/bin/bash
### AWK notes and examples

## structure:
# BEGIN {commands}
# /pattern/ {commands}
# END {commands}
# awk [options] file # command line
# awk [options] -f file # execute command.awk file
## commands:
# -F fs set separator
# -v var=value assign a value
# -f awkfile read commands from awk file
## variables:
# ARGC ARGV[i] 
# FS separator e.g. FS=","
# $N the Nth string
# $0 the whole line
# NF number of strings in the current line
# NR number of line
# FNR line number of current line
# FILENAME filename

# assign testname and print at the beginning
awk -v testname=shengwei 'BEGIN{print testname}'

# get $1 and $4 of each line, separated by whitespaces or tabs
awk '{++cnt} {print NR,$1,$4,cnt}' test.txt
echo "***"

# get $1 and $2, separated by , print at END
awk -F, 'END {print $1,$2}' test.txt
echo "***"
# print $1 $2 and $5, separated first by whitespaces then ,
awk -F '[ ,]' '{print $1,$2,$5}' test.txt
echo "***"

# get $1 and $1+a and $1s
awk -va=1 '{print $1,$1+a}' test.txt
echo "***"
awk -va=1 -vb=s '{print $1,$1+a,$1b}' test.txt
echo "***"

# filter
awk '$1>2 && $2=="Do" {print $1,$3}' test.txt
echo "***"

# pipe
awk 'BEGIN{print "to upper case"|"tr [a-z] [A-Z]"}'
free | grep Mem | awk '{print"remaining memory:\n", $7}'
# echo "***"

# regex
# awk 'BEGIN{IGNORECASE=1} $2 ~ /this/ {print $2,$4}' test.txt
# echo "***"
# awk '$2 !~ /this/ {print $2,$4}' test.txt
# echo "***"
echo "***regex***"
# . any single char except \n
echo -e "cat\nbat\nfun\nfin\nfan" | awk '/f.n/'
# ^ start of line
echo -e "This\nThat\nThere\nTheir\nthese" | awk '/^The/'
# $ end of line
echo -e "knife\nknow\nfun\nfin\nfan\nnine" | awk '/n$/'
# [] char set [^] exclusive set | alteration () grouping
echo "Call\nTall\nBall" | awk '/[CT]all/'
# ? 0 or 1 time occur
echo "Colour\nColor" | awk '/Colou?r/'
# * 0 or more times occur
echo "ca\ncat\ncatt" | awk '/cat*/'
# + 1 or more times occur
echo "111\n22\n123\n234\n456\n222" |awk '/2+/'

# control
awk 'BEGIN{a = 30;if (a==30) print "a=30";}'
awk 'BEGIN{for (i=1;i<=5;++i)print i}'