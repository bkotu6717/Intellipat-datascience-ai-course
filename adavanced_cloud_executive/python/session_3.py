print("************************* Sets *******************")
print("Sets are immutable objects and they do not have any order. It does not allow any duplicate values")
print('{1,2,3,4,5,6,7} is a set object')
set1 = {1,2,3,4,5,6,7,True,1}
print('type(set1): ', type(set1))
print('In set, True means 1, So True and 1 will be considered as one value.')
print('set.add(5) adds element to given set')
set1.add(10)
print('set1.add(10): ', set1)
set1.pop()
print('set1.pop() removes random element: ', set1)

print("************************* Uniion of Sets *******************")
set2 = {10,11,12,1,2,3,34}

print('set1.union(set2): ', set1.union(set2))

print("************************* Intersection of Sets *******************")
print('set1.intersection(set2): ', set1.intersection(set2))

print('************************* Sum of Sets ****************************')
print('operation set1 + set2 is not permitted ')

print('************************* Conditional statements (IF ELSE) ****************************')

age = 18
if age >= 18:
	print('You can have driving license')
else:
	print('You are not elegible for driving license')

a = 1
if a > 0:
	print('Positive number')
elif (a == 0):
	print('Number is zero')
else:
	print('Negative number')

print('------------------- greatest of three numbers -------------------')
a, b, c = 10, 20, 30
if a > b and a > c:
	print(a, ' is biggest')
elif( b > a and b > c):
	print(b, ' is biggest')
elif (a == b and b == c):
	print('a,b,c are equal')
else:
	print(c, ' is biggest')

print('************************* Loop statements ****************************')

# a,b,c = input('Enter there values.').split()
# print(a,b,c)
print('------------------- While loop --------------------')
i = 1
while i <= 10:
	print('i is ', i)
	i += 1

print('------------------- For loop on a array --------------------')
a = [11,12,13,14,15,16,17,18,19,20]
for i in a:
	print(i)

print('------------------- For loop on a tuple --------------------')
a = (11,12,13,14,15,16,17,18,19,20)
for i in a:
	print(i)

print('------------------- For loop on a range --------------------')
for i in range(10):
	print(i)

print('------------------- For loop on a range --------------------')


for i in range(len(a)):
	print(i, ': ', a[i])

print('------------------- Function -------------------------------')

def addition(a,b):
	return a+b

print(addition(1,2))


def sum_of_list(list_set):
	sum = 0
	for x in list_set:
		sum += x
	return sum

print(sum_of_list([1,2,3,4,5]))
















