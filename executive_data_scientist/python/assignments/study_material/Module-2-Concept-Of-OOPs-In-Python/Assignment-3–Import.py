# Problem Statement:
# You work in XYZ Corporation as a Data Analyst. Your corporation has told you to
# work on importing various functions.

# Tasks To Be Performed:

# 1. Create a Python file named Module:
# a. Inside the file, define 4 methods named – addition, subtraction,
# multiplication, and division.
# b. Each method should only accept 2 arguments and should return the
# result of operation performed in each method. For e.g., addition() should
# return the sum of two arguments.
# c. Save the Module file in .py format.

	# Refer module.py file

# 2. Open a new python file and import the Module.py file
# a. Now call the 4 methods from the Module.py file, i.e., addition(),
# subtraction(), multiplication(), and division().

# Refer import_demo.py

# 3. From the Module file, import only the addition() and pass the arguments so
# that it can display the result from the method.

from module import addition
print("addition(2,3): ", addition(2,3))

# 4. From the Module file, import only the subtraction() and pass the arguments
# so that it can display the result from the method.

from module import substraction
print("substraction(2,3): ", substraction(2,3))

# 5. From the Module file, import both the multiplication() and division() and
# pass the arguments so that it can display the result from the methods.

from module import multiplication, division
print("multiplication(2,3): ", multiplication(2,3))
print("division(2,3): ", division(2,3))

