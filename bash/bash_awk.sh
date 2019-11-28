# get $1 and $4 of each line, separated by whitespaces or tabs
awk '{print $1,$4}' bash_test.txt
echo "***"

# get $1 and $2, separated by ,
awk -F, '{print $1,$2}' bash_test.txt
echo "***"
# print $1 $2 and $5, separated first by whitespaces then ,
awk -F '[ ,]' '{print $1,$2,$5}' bash_test.txt
echo "***"

# get $1 and $1+a and $1s
awk -va=1 '{print $1,$1+a}' bash_test.txt
echo "***"
awk -va=1 -vb=s '{print $1,$1+a,$1b}' bash_test.txt
echo "***"

# filter
awk '$1>2 && $2=="Do" {print $1,$3}' bash_test.txt
echo "***"

# regex
awk 'BEGIN{IGNORECASE=1} $2 ~ /this/ {print $2,$4}' bash_test.txt
echo "***"
awk '$2 !~ /this/ {print $2,$4}' bash_test.txt
echo "***"