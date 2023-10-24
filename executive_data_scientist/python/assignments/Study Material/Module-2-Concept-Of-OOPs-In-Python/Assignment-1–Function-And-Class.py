# Problem Statement:
# You work in XYZ Corporation as a Data Analyst. Your corporation has told you to
# work on functions and classes.
# Tasks To Be Performed:

# 1. Create a function named ‘factor’ that can only accept 1 argument. The
# function should return the factorial of that number.

def factor(val):
  if (val <= 1): return val
  return val * factor(val-1)

print('factorial(5): ', factor(5))

# 2. Create a function named ‘check_string’, the function should accept a string
# data from the user and the function should check if the user input contains
# the letter ‘s’ in it. If it contains the letter ‘s’ then print- ‘The string is
# containing the letter ‘s’’, if not then print- ‘The string doesn’t contain the
# letter ‘s’’.

def check_string(str):
  print('string is: ', str)
  if ('s' in str):
    print("The string is containing the letter ‘s’")
  else:
    print("The string doesn’t contain the letter ‘s’")

check_string('Bhaskar')
check_string('Sushant')
check_string('Mirza')

# 3. Create a class named ‘student’ and inside the class, create a function
# named ‘fun1’- this method should accept the user defined input and return
# that value:

class Student:
  def fun1(self):
    val = input('Enter a value to return: ')
    return val

st = Student()
print("the fun1() has returned: ", st.fun1())


# a. Create another method named- message() and that method should print
# the user defined input that we have defined in ‘fun1’.

class Student:
  val = ''
  def fun1(self):
    val = input('Enter a value to return: ')
    self.val = val
  def message(self):
    print('the fun1() method was given value: ', self.val)
st = Student()
st.fun1()
st.message()


# 4. Create a lambda function that should double or multiply the number (that
# we will be passing in the lambda function) by 2. 
# Store the lambda function in a variable named ‘double_num’.
double_num = lambda a : a * 2
print('double_num(2): ', double_num(10))

# 5. Take user input string and check whether that string is palindrome or not.
def is_palindrome(string):
  str_len = len(string)
  flag = True
  for x in range(0,(str_len-1)):
    y = str_len - 1 - x
    if ((x < y) and string[x] != string[y]):
      flag = False
      break
  if flag:
    print(string, ' Polindrome string')
  else:
    print(string, ' Not polyndrome')

is_palindrome('bhaskar')
is_palindrome('malayalam')
is_palindrome('madam')
is_palindrome('mirza')

