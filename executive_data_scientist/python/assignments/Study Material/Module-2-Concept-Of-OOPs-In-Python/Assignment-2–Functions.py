# Problem Statement:
# You work in XYZ Corporation as a Python Developer. Your corporation has told
# you to work with the methods, and functions in Python.

# Tasks To Be Performed:
# 1. Create a class named ‘Super’ and inside that class define a user-defined
# function named fun1
# a. Inside the ‘fun1’ function, pass the message “This is function 1 in the
# Super class.” in the print statement.
class Super:
  def fun1(self):
    print('This is function 1 in the Super class.')

sp = Super()
sp.fun1()
# 2. Create another class named ‘Modified_Super’ and inherit this class from
# the Super class
# a. Inside the Modified_Super class, create a function named ‘fun1’ and
# pass the following message inside the print statement: ‘This is function 1 in
# the Modified Super class.’
# b. Create another user-defined function named ‘fun2’ and pass the
# message: ‘This is the 2 nd function from the Modified Super class’ in the
# print statement.
# c. After that, now create an object for the Modified_Super class and call the
# fun1().

class ModifiedSuper(Super):
  def fun1(self):
    print('This is function 1 in the Modified Super class.')
  def fun2(self):
    print('This is the 2 nd function from the Modified Super class')

ms = ModifiedSuper()
ms.fun1()
# 3. Create 2 methods named ‘Hello’. In the 1st Hello method, pass only one
# argument and pass this message: ‘This function is only having 1
# argument’. And in the 2nd Hello method, pass two arguments and pass
# this message: ‘This function is having 2 arguments’.
# a. Try to call both the methods and analyze the output of both the methods.

def hello(message):
  print('This function is only having 1 argument: ', message)
def hello(message1, message2):
  print('This function is having 2 arguments', message1, message2)

# hello('recived only one menssage')
hello('recived one menssage', 'recived two menssage')

# Python does not support method overloading and the last defined method will be 
# final definiton of the method


# 4. Create a method named ‘Sum’ that can accept multiple user inputs. Now
# add those user defined input values using for loop and the function should
# return the addition of the numbers.

def sum():
  inputs_count = int(input('How many numbers you want to sum?'))
  inputs = []
  total = 0
  for x in range(0, inputs_count):
    val = int(input('enter num: '))
    inputs.append(val)
    total += val
  return total

print("sum: ", sum())

# 5. Create a class named ‘Encapsulation’:
# a. Inside the class, first create a constructor. Inside the constructor,
# initialize originalValue variable as 10.
# b. After creating the constructor, define a function named ‘Value’ and this
# function should return the variable that we have initialized in the
# constructor.
# c. Now create a 2nd function named setValue, and pass an argument
# named ‘newValue’. The task of this function will be to replace the value of
# the originalValue variable by the value of newValue variable.

class Encapsulation:
  def __init__(self):
    self.originalValue = 10

  def value(self):
    return self.originalValue

  def setValue(self,newValue):
    self.originalValue = newValue

ec = Encapsulation()
print('ec.value(): ', ec.value())
print('ec.setValue(20): ', ec.setValue(20))
print('ec.value(): ', ec.value())

