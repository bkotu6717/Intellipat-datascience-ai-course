# Problem Statement:
# Consider yourself to be Sam who is a data scientist. He has been invited as a
# guest lecturer at a college to take an introductory session on Python.

# Tasks To Be Performed:
# 1. Create 1st tuple with values -> (10, 20, 30), 2nd tuple with values -> (40,
# 50, 60):
tuple_1 = (10, 20, 30)
tuple_2 = (40, 50, 60)

# a. Concatenate the two tuples and store it in “t_combine”
t_combine = tuple_1 + tuple_2
print(t_combine)
# b. Repeat the elements of “t_combine” 3 times
t_combine = t_combine * 3
print(t_combine)
# c. Access the 3rd element from “t_combine”
print(t_combine[2])
# d. Access the first three elements from “t_combine”
print(t_combine[0:3])

# e. Access the last three elements from “t_combine”
print(t_combine[-3:-1])


# 2. Create a list ‘my_list’ with these elements:
my_list = []
# a. First element is a tuple with values 1, 2, 3
my_list.append((1,2,3))
# b. Second element is a tuple with values “a”, “b”, “c”
my_list.append(('a', 'b', 'c'))
# c. Third element is a tuple with values True, False
my_list.append((True, False))

# 3. Append a new tuple – (1, ‘a’, True) to ‘my_list’:
my_list.append((1, 'a', True))
# a. Append a new list – *“sparta”, 123+ to my_list
my_list.append(('sparta', 123))

print(my_list)

# 4. Create a dictionary ‘fruit’ where:
fruit = {}
# a. The first key is ‘Fruit’ and the values are (“Apple”, “Banana”, “Mango”,
# “Guava”)
fruit['Fruit'] = ('Apple', 'Banana', 'Mango','Guava')
print(fruit)
# b. The second key is ‘Cost’ and the values are (85, 54, 120, 70)
fruit['Cost'] = (85, 54, 120, 70)
# c. Extract all the keys from ‘fruit’
print(fruit.keys())
# d. Extract all the values from ‘fruit’
print(fruit.values())

# 5. Create a set named ‘my_set’ with values (1, 1, “a”, “a”, True, True) and print the result.
my_set = set((1, 1, 'a', 'a', True, True))
print(my_set)

