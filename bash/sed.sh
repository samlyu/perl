#!/bin/bash
### SED notes and examples

## sed -option '/pattern/action' text_file
# -e: handle text file using script
# -f: handle text file using script file
# -n: only show scripting results
# -r: extended regex
# a: add string
# d: delete line
# i: insert string
# c: change string
# p: print string
# s: substitute string (with regex)

# do nothing, print test.txt
sed '' test.txt
sed -n 'p' test.txt
echo "***"

## SED Address Ranges
# '4,10d': delete 4th to 10th lines
# '4,+5d': delete 4th line and next 5 lines
# '2,5!d': delete everthing except 2nd to 5th lines
# '1~3d': delete 1st line, delete the 3th line after this line until EOF
# '2~2d': delete 2nd line, delete the 2nd line after this line until EOF

# add newLine after line 4 of test.txt
sed -e '4a\newLine' test.txt
echo "***"
# delete line 2 to line 3
sed -e '2,3d' test.txt
echo "***"
# delete line 3 to last line
sed -e '3,$d' test.txt
echo "***"
# add string after line 2
sed '2a drink tea' test.txt
echo "***"
# add (insert) string before line 2
sed '2i drink tea' test.txt
echo "***"
# add multiple lines using \
sed '2a drink tea, or...\
drink beer?' test.txt
echo "***"
# change line 2 and line 3
sed '2,3c WHAT??' test.txt
echo "***"
# search and print
sed -n '/like/p' test.txt
# search and substitute
echo "***"

## SED Substitution Flags
# g: replaces all matches not just the fist match
# NUMBER: replaces only the NUMBERth match
# p: prints the pattern space
# w FILENAME: write result to FILENAME
# i: case-insensitive match

sed -n 's/like/likeit/p' test.txt
echo "***"
# delete line 3 to last line, then substitute
sed -e '3,$d' -e 's/it/this/' test.txt
echo "***"

# substitute only on certain line
sed -e '3s/test/match/g' test.txt
echo "EOF"
