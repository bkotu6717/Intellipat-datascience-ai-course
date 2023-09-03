print('************************* String methods *************************')

print("String: ", "Anthing that is in enclosed with single quotes or double quotes is calle string.")
print("type('String text')", type('String text'))

print("Strings are immutable in python. i.e when you add additinal text to string a new string will be created.")
str = "Sample string"
print(id(str))
str += " updated"
print("after update, the id changes.", id(str))

print("str[0]='a' will produce error, since we can't update characters but we can append and that creates new string.")
print(str[0])

print('Reading string content within a given range is called slicing.')

print('Sample string:', 'A sample string')
print("Slicing syntax: a[start_index:last_index:step_count]")
print('First to sixth letter from "A sample string": ', 'A sample string'[1:6])
print('First to last letter from "A sample string": ', 'A sample string'[1:])
print('First to sixth letter from "A sample string": ', 'A sample string'[:6])

print('Interate over a string.')
a = 'A sample string, oh yea!'
i = 0
while (i <= len(a)-1):
	print(i, ': ', a[i])
	i += 1

print('get only last letter a[-1]: ', a[-1])
print('get only last 2 letters a[-2]: ', a[::-2])
print('get last 10 letter a[-10]: ', a[-10:])


print("replace method will replace a character in a string. string.replace(actual_string, target_string, num_of_matches)")
print("a : ", a)
a = a.replace('A', 'B', 2)
print("String after replace('A', 'B'): ", a)
print(a.index('a'))

print('How many s''s are there in string: ' , a.count('s'))

a = a.replace('st', 'ts')
print(a)

print('Split method spits the given string based on given delimeter: str.split(sepeator, max_count) ')
print('String split as 1: ', a.split(' ', 1))
print('String split as 2: ', a.split(' ', 2))
print('String afspli as 3: ', a.split(' ', 3))

print("''.join() method helps to join array of words")

list1 = ('My', 'Name', 'Is', 'Python', 'And', 'I', 'Am', 'Interesting')

print('list is joiend', ' '.join(list1))

print("List is array in python")

list2 = [1, 2, 3, 'Hi', 'hello', True, False]
list2[2] = 'replaced'
list2.append('Bhaskar')
print(list2)
print("list2.append() adds element at the end", list2)
list2.insert(4, 4)
print("list2.insert(index, value): ", list2)

print('************************* Remove elements from a list *************************')

print('Remove elements from a list')
list2.pop()
print('list2.pop() removes the last element of the list', list2)

list2.pop(0)
print('list2.pop(3) removes element at index: ', list2)

list2.remove(True)
print("list2.remove(1) removes 1 from the list: ", list2)

list2.reverse()
print('list2.reverse() reverses a given list', list2)

print('list2[::-1] also reverse a list', list2[::-1])

list1 = [10, 11, 12, 13, 14, 15]
list1.extend(list2)
print('list1.extend(list2) will prepend list2 to list1: ', list1)

print('************************* Tuple *************************')
tup1 = (1,2,3,4,5,6,7,8,9,10)
print('tup1: ', tup1)
print('tup1[1] accesses the element at index 1: ', tup1[1])
print('(1) gives integer type: ', type((1)))
print('(1,) gives tuple type: ', type((1,)))
print('(1,2) gives tuple type:', type((1,2)))
print('Tuples are immutable, to make it editable we need to convert to list and then reconvert to tuple')


print('************************* Dictionary *************************')

dict1 = {"name": 'Bhaskar', "age": 34 }
print('Dictionary is a hash that has only stringified keys: ', dict1)
print('dict1.keys() method displayes all the keys: ', dict1.keys())
print('dict1.values() method displayes all the values: ', dict1.values())
print('dict1.items() method displayes all the key-values: ', dict1.items())


print('************************* Typecasting *************************')
a = 1
print('type(a) is: ', type(a))

print('************************* Lis to Tuple converstion *************************')
list1 = [1,2,3,45,5]
print('type(list1): ', type(list1))
list1 = tuple(list1)
print('type(list1) after converstion: ', type(list1))
list1 = list(list1)
print('type(list1) after converstion again: ', type(list1))


