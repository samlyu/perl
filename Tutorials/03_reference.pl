$scalar = "Hello";
@scalar = ("Hello", "World", 123);
$refer = "scalar";
print("$$refer\n");		# $scalar
print("$$refer[0]\n");	# $scalar[0]

$foo = "Hello"; @arr=(1..5);
$scalarref = \$foo;
$constref = \186_282.42;
$arrayref = \@arr;
$arrRef = [1,2,3,4,5];
# to get the value
print("${$scalarref} \n");
print("${$constref} \n");
print("${$arrayref}[0] \n");
print("${$arrRef}[0] \n");
