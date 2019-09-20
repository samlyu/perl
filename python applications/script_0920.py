from itertools import groupby

data_list = []
data_nonum = []
data_combined = []
data_count = []
data_final = []

fin = open('old_0920')
data_lines = fin.read()
data_temp = data_lines.replace('\n', ' ').replace('+', ' ')
data_list = data_temp.split()
fin.close()

for i in range(len(data_list)):
    if ('<' not in data_list[i] and '[' not in data_list[i]):
        data_nonum.append(data_list[i])
    else:
        if '[' in data_list[i]:
            data_nonum.append(data_list[i].split('[')[0])
        else:
            data_nonum.append(data_list[i].split('<')[0])

data_combined = groupby(data_nonum)
for l,s in data_combined:
    data_count.append(len(list(s)))
    data_final.append(l)

fout = open('new_0920', 'w')
for i in range(len(data_count)):
    if(data_count[i] == 1):
        fout.write('wire ' + data_final[i] + '\n')
    else:
        fout.write('wire ' + data_final[i] + '[' + str(data_count[i]-1) + ':0]' + '\n')
fout.close()
