# Problem Statement:
# You work in XYZ Corporation as a Data Analyst. Your corporation has told you to
# use the NumPy package and do some tasks related to that.

# Tasks To Be Performed:
# 1. Create a 3x3 matrix array with values ranging from 2 to 10.
import numpy as np
a = np.arange(2,11)
b = a.reshape((3, 3))
print(a.ndim)
print(b.ndim)
print(b)


# 2. Create a NumPy array having user input values and convert the integer
# type to the float type of the elements of the array. For instance: Original
# array [1, 2, 3, 4] Array converted to a float type: [ 1. 2. 3. 4.]

x = input('enter element: ').split()
a = np.array(x)
b = np.asfarray(a)
print(a)
print(b)
b = b.reshape(2,2)
print(b)

# 3. Write a NumPy program to append values to the end of an array. For
# instance: Original array: [10, 20, 30] . After that, append values to the end
# of the array: [10 20 30 40 50 60 70 80 90]
a = np.array([10, 20, 30])
a = np.append(a,[10, 20, 30, 40, 50, 60, 70, 80, 90])
print(a)

# 4. Create two NumPy arrays and add the elements of both the arrays and
# store the result in sumArray.
a = np.array([[10, 20, 30], [40, 50, 60]])
b = np.array([[11, 21, 31], [41, 51, 61]])
print(np.add(a,b))
r = a + b
print(r)


# 5. Create a 3x3 array having values from 10-90 (interval of 10) and store that
# in array1
a = np.arange(10,91,10)
a = a.reshape((3,3))
print(a)
# Perform the following tasks:
# a. Extract the 1st row from the array
print(a[0])
# b. Extract the last element from the array
print(a[2][-1])
print(a[-1][-1])



