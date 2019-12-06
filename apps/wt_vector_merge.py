import re
from collections import defaultdict

file = open('wt_vectors', 'r')
vectors = file.read().split()
# print(vectors)

dict_max = defaultdict(str)
dict_min = defaultdict(str)
var_name = 0
var_idx = 0
var_name_last = 0
var_idx_last = 0
var_dir = False		# Judge direction           --- [3:0] or [0:3]
var_count = 0		# Judge if only one element --- b[2]
var_continuous = True	# Judge if continuous       --- a[0] a[2] a[3] => a[0] a[2:3]

for vector in vectors:
	var_name = re.search(r'^[a-zA-Z]', vector).group()
	var_idx_p = re.search(r'\[\d+\]', vector).group()
	var_idx = int(re.search(r'\d+', var_idx_p).group())

	# Continuous judgement
	if var_name == var_name_last and ( var_idx_last == int(var_idx + 1) or var_idx_last == int(var_idx - 1) ):
		var_continuous = True
	else:
		var_continuous = False

	# Segment judgement
	if var_name_last != 0 and var_continuous == False:
		# Only one element
		if var_count == 0:
			print(var_name_last + '[' + str(dict_max[var_name_last]) + ']')
		else:
			if var_dir == True:
				print(var_name_last + '[' + str(dict_max[var_name_last]) + ':' + str(dict_min[var_name_last]) + ']')
			else:
				print(var_name_last + '[' + str(dict_min[var_name_last]) + ':' + str(dict_max[var_name_last]) + ']')
		# Refresh counter
		var_count = 0
		# Same index but not continuous
		if var_name == var_name_last:
			dict_max[var_name] = ''
			dict_min[var_name] = ''

	# Direction judgement && increment counter
	if var_idx_last > var_idx:
		var_dir = True
	else:
		var_dir = False

	# Increment counter
	if var_name == var_name_last and var_idx != var_idx_last and var_continuous == True:
		var_count = var_count + 1

	# Max
	if dict_max[var_name] == '':
		dict_max[var_name] = var_idx
	else:
		if var_idx > dict_max[var_name]:
			dict_max[var_name] = var_idx

	# Min
	if dict_min[var_name] == '':
		dict_min[var_name] = var_idx
	else:
		if var_idx < dict_min[var_name]:
			dict_min[var_name] = var_idx

	var_name_last = var_name
	var_idx_last = var_idx
	var_dir_last = var_dir

# The last one
if var_count == 0:
	# Only one element
	print(var_name_last + '[' + str(dict_min[var_name_last]) + ']')
else:
	if var_dir == True:
		print(var_name_last + '[' + str(dict_max[var_name_last]) + ':' + str(dict_min[var_name_last]) + "]")
	else:
		print(var_name_last + '[' + str(dict_min[var_name_last]) + ':' + str(dict_max[var_name_last]) + "]")
