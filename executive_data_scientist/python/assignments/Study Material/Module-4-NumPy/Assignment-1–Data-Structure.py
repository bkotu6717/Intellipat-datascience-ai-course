# Problem Statement:
# You work in XYZ Corporation as a Data Analyst. Your corporation has told you to
# work with the structure of the data.

# Tasks To Be Performed:

# 1. Create a list named ‘myList’ that has the following elements: 10, 20, 30,
# ‘apple’, True, 8.10:
# a. Now in the ‘myList’, append these values: 30, 40
# b. After that, reverse the elements of the ‘myList’ and store that in
# ‘reversedList’
myList = [10, 20, 30, 'apple', True, 8.10]
myList.extend([30,40])
reversedList = myList[::-1]
# reversedList = myList[-1::-1]
print('reversedList: ', reversedList)

# 2. Create a dictionary with key values as 1, 2, 3 and the values as ‘data’,
# ‘information’ and ‘text’:
# a. After that, eliminate the ‘text’ value from the dictionary
# b. Add ‘features’ in the dictionary
# c. Fetch the ‘data’ element from the dictionary and display it in the output
dictionary = {
  1: 'data',
  2: 'information',
  3: 'text'
}
print('dictionary: ', dictionary)
dictionary[3] = None
print('dictionary: ', dictionary)
dictionary[3] = 'features'
print('dictionary: ', dictionary)

for key, value in dictionary.items():
  if value == 'data':
    print(key, value)
    break


# 3. Create a tuple and add these elements 1, 2, 3, apple, mango in my_tuple.
my_tuple = (1, 2, 3, 'apple', 'mango')

# 4. Create another tuple named numeric_tuple consisting of only integer
# values 10, 20, 30, 40, 50:
numeric_tuple = (10, 20, 30, 40, 50)

# a. Find the minimum value from the numeric_tuple
print(min(numeric_tuple))

# b. Concatenate my_tuple with numeric_tuple and store the result in r1
r1 = my_tuple + numeric_tuple
print(r1)
# c. Duplicate the tuple named my_tuple 2 times and store that in ‘newdupli’

newdupli = my_tuple * 2
print(newdupli)

# 5. Create 2 sets with the names set1 and set2, where set1 contains
# {1,2,3,4,5} and set2 contains {2,3,7,6,1}
set1 = {1,2,3,4,5}
set2 = {2,3,7,6,1}
# Perform the below operation:
# a. set1 union set2
print(set1.union(set2))
# b. set1 intersection set2
print(set1.intersection(set2))
# c. set1 difference set2
print(set1.difference(set2))

