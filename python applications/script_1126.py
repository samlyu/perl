#*****************************************************************************************
#-----------------------------------------------------------------------------------------
# Function         : Modify netlist file format:
#			nh -> nhv
#			ph -> phv
#			nhz -> nhvn
#			instance name before nh|ph|nhz: mX* -> X*
#-----------------------------------------------------------------------------------------
#******************************************************************************************

import re, sys

if len(sys.argv) == 1:
    print("Netlist file name argument is empty")
    sys.exit()
else:
    file_name = sys.argv[1]

f = open(file_name, 'r')
text = f.readlines()
f.close()

text_new = list()
for i in range(len(text)):
	flag_plus = re.findall(r'\+', text[i])

	if flag_plus:
		text_temp = text_new[-1] + text[i]
		text_temp_noplus = re.sub(r'\+', '', text_temp).replace('\r', '').replace('\n', '')
		text_new[-1] = text_temp_noplus
	else:
		text_new.append(text[i].replace('\r', '').replace('\n', ''))

for i in range(len(text_new)):
	flag_nh = re.findall(r'\snh\s', text_new[i])
	flag_ph = re.findall(r'\sph\s', text_new[i])
	flag_nhz = re.findall(r'\snhz\s', text_new[i])
	if flag_nh or flag_ph or flag_nhz:
		text_new[i] = re.sub(r'^mX', 'X', text_new[i])
	if flag_nh:
		text_new[i] = re.sub(r'\snh\s', ' nhv ', text_new[i])
	if flag_ph:
		text_new[i] = re.sub(r'\sph\s', ' phv ', text_new[i])
	if flag_nhz:
		text_new[i] = re.sub(r'\snhz\s', ' nhvn ', text_new[i])

file_name_new = re.sub(r'.netlist', '_new.netlist', file_name)
fnew = open(file_name_new, 'w')
for i in range(len(text_new)):
	fnew.write(text_new[i] + '\n')
print('New netlist file generated: ' + file_name_new)
