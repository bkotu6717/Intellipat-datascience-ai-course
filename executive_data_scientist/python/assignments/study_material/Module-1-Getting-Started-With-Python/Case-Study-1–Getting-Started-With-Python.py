# Problem Statement:
# Consider yourself to be Sam who is a data scientist. He has been invited as a
# guest lecturer at a college to take an introductory session on Python.

# Tasks To Be Performed:

# 1. Create a list containing squares of numbers from 1 to 10 (HINT: use List
# Comprehension).
numbers = list(range(1,11))

# Using list comprehension
squares = [x**2 for x in numbers]

print('squares_list: ', squares)

# 2. Write a function to check if the year number is a leap year.
def is_leap_year(year):
  if (year%4 == 0) and ((year%100 != 0) or (year%400 == 0)): print('leap year')
  else: print('not leap year')

year = int(input('Enter the year'))
is_leap_year(year)




# 3. Write a function to take an array and return another array that contains the
# members of the first array that are even.
def even_numbers(arr):
  even_list = []
  for x in arr:
    if(x%2 == 0):
      even_list.append(x)
  return even_list

print(even_numbers(list(range(0,10))))

# 4. Write a function that takes 2 arrays and prints the members of the first
# array that are present in the second array. (HINT: use Membership
# Comprehension)

def print_elements(arr1, arr2):
  elements = []
  for x in arr1:
    if x in arr2:
      elements.append(x)
  return elements

print(print_elements([1,2,3,4], [3,4,5,6]))

