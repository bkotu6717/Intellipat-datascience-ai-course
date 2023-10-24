# Problem Statement:
# You work in XYZ Corporation as a Data Analyst. Your company has told you to
# work with the looping statements.

# Tasks To Be Performed:
# 1. Create an array that has user defined inputs and with the help of for loop,
# fetch all the prime numbers and print the numbers.

import math
inputs_count = int(input('How many inputs you want to give? '))
inputs = []
primes = []

for x in range(1,inputs_count+1):
  element = int(input('Enter element '))
  inputs.append(element)

for x in inputs:
  upper_limit = math.ceil(math.sqrt(x)) + 1
  prime = True
  if (x < 2):
    prime = False
  elif (x == 2):
    pass
  else:
    for y in range(2, upper_limit):
      if x%y == 0:
        prime = False
        break

  if(prime):
    primes.append(x)

print('inputs: ', inputs)
print('prime numbers: ', primes)



