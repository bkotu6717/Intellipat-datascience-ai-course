#1 It is a high level, interpreted and object oriented programming language
  # High level: Easy to undestand
  # Object oriented: Dealing with real world objects

  # Interpreted language: Executes the code line by line without having to pre-compile it before running it
print("Hello python") # Works
print("hello python!") # Works
# prin("hello python!") # Fails here
print("hello python!") # Won't execute this since previous line is having error

print('Single quotes working')

# Uses of python
  #1 Web development
  #2 Machine learning
  #3 Automation
  #4 Data analysis
  #5 Cloud

# Variables
print("Variable: It is container that holds some value")

# Creation of variable
# print(a) # Throws error since it has no value assigned

# Assign value to variable
a = 1
print("a has value: ", a)

# creattion of multiple variables
x,y,z = 10,20,30
print("values to x,y,z: ", x,y,z)
print(x,y,z)

print("Rules to name a variable")
print("Use words only, no numbers and special characters alone")
print("We can use variable name with numebrs and _ special characters")

print("""This is a multiline comment\nyes this gets printed in a new line\nThis is a cool feature""")

multiline_string = """
  Hi,
  How are you?
  Hope you are doing fine.
  Ping me when you check this message.
"""
print(multiline_string)

multiline_string = '''
  Hi,
  "How are you?"
  Hope you are doing fine.
  Ping me when you check this message.
'''

print(multiline_string)

___ = "Hello"
print("multiple underscores in a variable is allowed: ",___)


'''
This is a multiline comment
Yes it is
This text wont be executed.
'''

"""
This is a multiline comment
Yes it is
This text wont be executed.
"""

print("Use type method to find the data type of  variables")
print("type(1) is of ", type(1))
print("type(1.0) is of ", type(1.0))
print("type(Hello) is of ", type('hello'))
print("type(True) is of ", type(True))
print("type(False) is of ", type(False))
print("(0 == False): ", 0 == False)
print("(1 == False): ", 1 == False)
print("(1 == True): ", 1 == True)

print("Strings are immutable in python")
name = "Bhaskar"
print(id(name))
name += "Rao"
print(id(name))
print("Name is updated to Rao", name+' Rao')

# In Python, strings are made immutable so that programmers cannot alter the contents of the object (even by mistake).
# This avoids unnecessary bugs. Some other immutable objects are integer, float, tuple, and bool. 
# More on mutable and immutable objects in Python.


print("Iterate over a string.")
for x in range(0,len(name)):
  print(name[x])


print("Use slice method to get a substring from a big string")
a = "Use slice method to get a substring from a big string"
print("Slice method syntax: variable_name[start_index:end_index]")
print("Slicing from 2 to 10 (a[2:10]): " ,a[2:10])


# Step count while applying slicing on a string
print("Slice method syntax with step count: variable_name[start_index:end_index:step_count]")

print("Slicing from 2 to 10 (a[2:10:2])", a[2:10:2])
print("Read from index to till last: ", a[0:-1:2])

print("a[::-1] reverses a give string: ", a[::-1])

