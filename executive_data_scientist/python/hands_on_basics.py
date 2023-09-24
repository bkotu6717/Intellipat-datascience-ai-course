import math
import time

def check_prime(num):
  # print('square root: ', math.sqrt(num))
  for i in (range(2, math.ceil(math.sqrt(num))+1)):
    if num%i == 0:
      return False

  return True

for i in range(3, 50):
  is_prime = check_prime(i)
  print(i, "is prime?: ", is_prime)

print("Time: ", time.time())