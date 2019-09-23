fin = open('nv_1903_in')
rpt_lines = fin.readlines()
Add = rpt_lines[1].split()[1:]
Mul = rpt_lines[2].split()[1:]
Sma = rpt_lines[3].split()[1:]
Lar = rpt_lines[4].split()[1:]
Con = rpt_lines[5].split()[1:]
Pip = rpt_lines[6].split()[1:]
Pro = rpt_lines[7].split()[1:]

fout = open('nv_1903_out','w')
RAM_AREA_PER = ( float(Sma[0])*float(Sma[1]) + float(Lar[0])*float(Lar[1]) ) / ( float(Add[0])*float(Add[1]) + float(Mul[0])*float(Mul[1]) + float(Sma[0])*float(Sma[1])+float(Lar[0])*float(Lar[1]) + float(Con[0])*float(Con[1]) + float(Pip[0])*float(Pip[1]) + float(Pro[0])*float(Pro[1]) )*100
fout.write("RAM_AREA_PER = " + "{:.2f}".format(RAM_AREA_PER) + '%\n')

ALU_POWER_PER = ( float(Add[0])*float(Add[2]) + float(Mul[0])*float(Mul[2]) ) / ( float(Add[0])*float(Add[2]) + float(Mul[0])*float(Mul[2]) + float(Sma[0])*float(Sma[2])+float(Lar[0])*float(Lar[2]) + float(Con[0])*float(Con[2]) + float(Pip[0])*float(Pip[2]) + float(Pro[0])*float(Pro[2]) )*100
fout.write("ALU_POWER_PER = " + "{:.2f}".format(ALU_POWER_PER) + '%\n')
fout.close()
