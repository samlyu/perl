import re

wr = []
addr = []
data = []

f1 = open('old_0905')
while 1:
    line = f1.readline()
    if not line:
        break

    linea = re.sub(r'.*wr: ','', line)
    listb = linea.strip('\n')
    linec = re.split(', addr: |, data: ', listb)
    # print(linec)
    wr.append(linec[0])
    addr.append(linec[1])
    data.append(linec[2])
f1.close()

# print(wr)
# print(addr)
# print(data)

f2 = open('new_0905','w')
for i in range(len(wr)):
    if(wr[i]=='1'):
        f2.write('WRITE16(WTN_AI_START_ADDR + (')
        f2.write(addr[i])
        f2.write(' * 2), ')
        f2.write(data[i])
        f2.write(');\n')
    else:
        f2.write('READ16(WTN_AI_START_ADDR + (')
        f2.write(addr[i])
        f2.write(' * 2));\n')
f2.close()

