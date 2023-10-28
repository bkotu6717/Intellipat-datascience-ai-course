

import numpy as np

zero_dim_array = np.array(10)
print('zero_dim_array: ', zero_dim_array)
print('zero_dim_array.ndim: ', zero_dim_array.ndim)
print('zero_dim_array.shape: ', zero_dim_array.shape)


one_dim_array = np.array([1,2,3,4])
print('one_dim_array: ', one_dim_array)
print('one_dim_array.ndim: ', one_dim_array.ndim)
print('one_dim_array.shape: ', one_dim_array.shape)
print('acces element 4: ', one_dim_array[3])
print('reshape to 2x2: ', one_dim_array.reshape(2,2))


two_dim_array = np.array([
  [1,2,3,4,5],
  [6,7,8,9,10]
  ])
print('two_dim_array: ', two_dim_array)
print('two_dim_array.ndim: ', two_dim_array.ndim)
print('two_dim_array.shape: ', two_dim_array.shape)
print('acces element 9: ', two_dim_array[1,3])

three_dim_array = np.array(
  [[
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [10,11,12]
  ]]
  )
print('three_dim_array: ', three_dim_array)
print('three_dim_array.ndim: ', three_dim_array.ndim)
print('three_dim_array.shape: ', three_dim_array.shape)

four_dim_array = np.array(
  [[[
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [10,11,12]
  ]]]
  )
print('four_dim_array: ', four_dim_array)
print('four_dim_array.ndim: ', four_dim_array.ndim)
print('four_dim_array.shape: ', four_dim_array.shape)

# Accessing array elements


# Problem Statement:
# Numpy library package from python is one of the most useful while conducting any 
# statistical analysis in data science. Familiarize yourself with the nitty gritties 
# of the numpy and various modules that it comes with.
# Tasks To be Performed:

# 1. Create a numpy array with numpy.array module and with a data type integer and float.

print('*'*30)
integer_np_arry = np.array([1,2,3,4,5], dtype='int64')
print('integer_np_arry: ', integer_np_arry)
print('type(integer_np_arry): ', integer_np_arry.dtype)

float_np_arry = np.array([1,2,3,4,5], dtype='float64')
print('float_np_arry: ', float_np_arry)
print('type(float_np_arry): ', float_np_arry.dtype)


# 2. Create numpy arrays that have zero, one, two, three, Four dimensions respectively.
# Also, print the shape and dimensions of the numpy arrays created above.
print('*'*30)

zero_dim_array = np.array([1,2,3,4])
print('dim: ', zero_dim_array.ndim)
print('shape: ', zero_dim_array.shape)


# 3. Create a 2x3, 3x3, and 4x4 identity matrix using numpy.
print('*'*30)
identity_2_2_matrix = np.identity(2, dtype='int64')
print(identity_2_2_matrix)

identity_3_3_matrix = np.identity(3, dtype='int64')
print(identity_3_3_matrix)

identity_4_4_matrix = np.identity(4, dtype='int64')
print(identity_4_4_matrix)

identity_2_3_matrix = np.eye(2,3, dtype='int64')
print(identity_2_3_matrix)


# 4. Create a numpy array with shape 2x5 that has all the elements as zero.
print('*'*30)
arr = np.zeros((2,5), dtype='int64')
print(arr)

# 5. Create a numpy array that has the shape 3x5 and all the elements are 5.
print('*'*30)
arr = np.zeros((3,5), dtype='int64')+5
print(arr)

arr2 = np.full((3,5), 5)
print(arr2)

arr2 = np.ones((3,5), dtype='int64')*5
print(arr2)
arr2 = np.eye(3,5, dtype='int64')*0+5
print(arr2)
# 6. Create a numpy array with random integers in the range 0-100, and the sample size
# should be 25.
print('*'*30)
arr = np.random.randint(0,101,25)
print(arr)
# 7. Create a numpy array with a shape 3x3 that has all elements as 1.
print('*'*30)
print('7. Create a numpy array with a shape 3x3 that has all elements as 1.')

arr2 = np.full((3,3), 1)
print(arr2)

arr2 = np.ones((3,3))
print(arr2)

# 8. Create a numpy array in the shape 2x3 with random integers in the range 0-100.
# Reshape the array in the shape 3x2 and print the updated shape of the resultant array.
print('*'*30)
print('''8. Create a numpy array in the shape 2x3 with random integers in the range 0-100. 
  Reshape the array in the shape 3x2 and print the updated shape of the resultant array.''')
arr = np.random.randint(0,101,size=(2,3))
new_arr = arr.reshape(3,2)
print(new_arr)
# 9. Create a random array, with the range 0-1000, with a size 50 and step 2. Perform the
# following operations on the same.
print('*'*30)
arr = np.random.randint(0,1000,50)
print(arr)
# a. Print the first ten elements of the array.
print(arr[0:10])
# b. Print the last ten elements of the array
print(arr[40:])

# c. Print the elements from the indexes 10-25
print(arr[10:26])

# d. Print the element at the index 22
print(arr[22])

# e. Print the array using negative indexing.
print(arr[51::-1])
# f. Print the last ten elements of the array, using negative indexing.
print(arr[-10:])

# 10. Given a numpy array that has values = [1,2,3,4,5]. 
print('*'*30)

arr = np.array([1,2,3,4,5])
print(arr)
# Perform the following operations.
# a. Insert the element 6 at the end of the array.
arr = np.insert(arr, 5, 6)
print(arr)
# b. Insert the element 10 at the beginning of the array.
arr = np.insert(arr, 0, 10)
print(arr)
# c. Insert the element 30, before 4.
arr = np.insert(arr, 4, 10)
print(arr)

# d. Update the element 5 as 50.
arr[arr == 5] = 50
print(arr)
# e. Delete the element 50 in the updated array.
arr = np.delete(arr, 6)
print(arr)
# f. Create a function to search for the element 30.
def search(arr, element):
  if element in arr:
    return True
  else:
    return False
print(search(arr, 11))
# g. Sort the array in ascending order.
print(np.sort(arr))
# h. Find index of element
index = np.where(arr==10)
if len(index[0]) > 0:
  print('element present at',index[0])
else:
  print('element not present')




