#!/usr/bin/python3
### Python Regex notes and examples
import re

line = "Cats are smarter than dogs"
## re.match: only find match at the beginning of the string
matchObj = re.match(r'dogs', line, re.M|re.I)
if matchObj:
	print(matchObj.group())
else:
	print("No Match!")
## re.search: greedy search
searchObj = re.search(r'dogs', line, re.M|re.I)
if searchObj:
	print(searchObj.group())
else:
	print("Nothing found!")
## re.sub: replace pattern
res = re.sub(r'^.*ts', 'What', line)
print(res)
## Modifiers
# re.I: case-insensitive
# re.M: '^$' is start/end of line not of string
# re.S: '.' matchs any char including newline

## Patterns
# ^	beginning of line
# $	end of line
# .	any char except newline
# [...]	any char in brackets
# [^...]	any char not in brackets
# xxx*	0 or more occurs of preceding expr
# xxx+	1 or more occurs of preceding expr
# xxx?	0 or 1 occur of preceding expr
# xxx{n}	n number of occurs of preceding expr
# xxx{n,}	n or more number of occurs of preceding expr
# xxx{n,m}	n to m number of occurs of preceding expr
# a|b	matches a or b
# \w	matches word
# \W	matches nonword
# \s	matches \t\n\r\f
# \S	matches nonwhitespace
# \d	matches digits [0-9]
# \D	matches nondigits
# \A	matches beginning of string
# \Z	matches end of string before newline

res = re.sub(r'rub[y|e]', 'match', 'rube ruby')
print(res)

res = re.sub(r'[a-zA-Z0-9]', 'char ', 'asdf1234QWERTY')
print(res)

res = re.sub(r'[^0-9]', 'nonum ', '1a2s3d4f')
print(res)

