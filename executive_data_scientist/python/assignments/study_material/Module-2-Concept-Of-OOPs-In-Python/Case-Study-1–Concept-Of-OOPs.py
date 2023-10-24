# Problem Statement:
# Consider yourself to be Sam who is a software engineer. He has been asked to
# build an employee management app. You have to use the OOPs concept to build
# a few classes as outlined in the steps below.

# Tasks To Be Performed:
# 1. Create a class named Employee, with a constructor ‘__init__’ method that
# accepts name and salary as parameters and set properties named name
# and salary.

class Employee:
  def __init__(self, name, salary):
    self.name = name
    self.salary = salary


# 2. Define __str__ method in Employee class so that when someone tries to
# print the object the string Name: employee_name, Salary:
# employee_salary is printed with the actual employee name and salary.

class Employee:
  def __init__(self, name, salary):
    self.name = name
    self.salary = salary
  def __str__(self):
    return (self.name + ' ' + self.salary)

print(str(Employee('bhaskar', '100K')))
# 3. Create another class named Calculator, with methods to add, subtract,
# multiply and divide two numbers.

# 4. These methods take two numbers as parameters.

class Calculator:
  def add(self, a, b):
    return a + b
  def substract(self, a, b):
    return a - b
  def multiply(self, a, b):
    return a * b
  def divide(self, a, b):
    return a/b

# 5. These methods will be called by a method named execute command.
# 6. Execute command takes in 3 parameters command which is string that can
# be either ‘add’, ‘sub’, ‘mul’, ‘div’, and two numbers and it will call the
# appropriate method based on command parameter.

def execute(operation, val1, val2):
  c = Calculator()
  if operation == 'add':
    return c.add(val1, val2)
  elif operation == 'sub':
    return c.substract(val1, val2)
  elif operation == 'mul':
    return c.multiply(val1, val2)
  elif operation == 'div':
    return c.divide(val1, val2)

print(execute('add', 1, 2))
print(execute('sub', 1, 2))
print(execute('mul', 1, 2))
print(execute('div', 1, 2))


