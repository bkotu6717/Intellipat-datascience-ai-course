print('---------------------- print factorial value of given number ----------------------')

def factorial(num):
	fact = 1
	for x in range(1,num+1):
		fact *= x
	return fact

for x in range(2,10):
	print(factorial(x))

print('---------------------- Recursive factorial calcualtion ----------------------')

def factorial(num):
	if (num <= 1):
		return num
	return num * factorial(num-1)

for x in range(2,10):
	print(factorial(x))

print('---------------------- recursoin example ----------------------')

def function(num):
	if num == 0:
		return
	print(num)
	function(num-1)
	print(num)

function(3)