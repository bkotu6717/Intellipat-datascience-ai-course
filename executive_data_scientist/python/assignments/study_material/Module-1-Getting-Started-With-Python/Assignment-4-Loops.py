# Problem Statement:
# You work in XYZ Corporation as a Data Analyst. Your company has told you to
# work with the looping statements.

# Tasks To Be Performed:
# 1. Create a list that has 10, 23, 4, 26, 4, 75, 24, 54 values and with the help
# of while loop fetch the even numbers and print the numbers
list1 = [10, 23, 4, 26, 4, 75, 24, 54]
list_size = len(list1)
even_numbers = []
x = 0
while(x < (list_size-1)):
	if(list1[x]%2 == 0):
		even_numbers.append(list1[x])
	x += 1

print(even_numbers)