from itertools import groupby
import re

text_keys = []
text_count = []

fin = open('nv_1908_in')
text_lines = fin.read()
fin.close()

text_words = re.sub(r"[,.@#?;'!&$]+\ *"""," ",text_lines)
text_list = text_words.split()
text_list_lower = [item.lower() for item in text_list]
text_list_lower.sort()

text_combined = groupby(text_list_lower)
for l,s in text_combined:
    text_count.append(len(list(s)))
    text_keys.append(l)

fout = open('nv_1908_out','w')
for i in range(len(text_count)):
    fout.write(text_keys[i] + '\t' + str(text_count[i]) + '\n')

fout.close()
