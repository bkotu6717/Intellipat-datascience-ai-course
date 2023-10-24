# Problem Statement:
# You work in XYZ Corporation as a Data Analyst. Your company has told you to
# work with the if-else condition.

# Tasks To Be Performed:
# 1. Take three user inputs and print the greatest number from those inputs
# using if-else condition. Edge cases, if any, should also be handled

a = int(input('Enter value for a '))
b = int(input('Enter value for b '))
c = int(input('Enter value for c '))

if(a > b) and (a > c):
	print('a is grestest number')
elif(b > a) and (b > c):
	print('b is grestest number')
elif(c > b) and (c > a):
	print('c is grestest number')
else:
	print('a,b and c are equal')
