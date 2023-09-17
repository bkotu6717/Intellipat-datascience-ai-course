print('------------- Collections (LIST, TUPLE, SET, DICTIONARY)' )
print('--------------------- LIST [] -----------------------')
print('List uses square brackets [], duplicates are allowed')
print('Data is accessible using index')
print('Lists are mutable, means you can change a particular value')
names = ['Bhaskar', 'Rao', 'K', 'Bhaskar']
print('list: ', names)
print('names[0]', names[0])
print('names[1]', names[1])
print('names[2]', names[2])
print('names[3]', names[3])

print('--------------Accessing in reverse order---------------')
print('names[-1]', names[-1])
print('names[-2]', names[-2])
print('names[-3]', names[-3])
print('names[-4]', names[-4])

print('--------------Lists ar mutable i.e element at a given index can be modified---------------')
names[1] = 'Lasya'
print("names[1] = 'Lasya'")
print('names after update', names)


print('---------------- Removing element from a list ------------------')

print("names.pop() removes last element in the list: ")
names.pop()
print('after names.pop()', names)

print("names.pop(index) removes element at given position")
names.pop(1)
print('after names.pop(1)', names)

index_to_be_removed = names.index('K')
print('names.index("K")', index_to_be_removed)
names.append('sachin')
names.append('dravid')
print(names)
if 'sachin' in names:
	names.remove('sachin')
print('after removing sachin:', names)

print("names.insert(position, value'), add element at given position'")
names.insert(1, 'Anil')
print(names)

names[1], names[2] = names[2], names[1]
print('names after swaping position 1 and 2', names)

new_list = [1,2,3,4]
new_list.clear()
print('list.clear() will empty the list:', new_list)
new_list = [1,2,3,4, -1]
print('use + to join two sets: ', names + new_list)
names.extend(new_list)
print('use lsit1.extend(list2) to join 2 lists in a opthimized way:', names)
new_list.sort()
print('list.sort() to sort the list:', new_list)

names = ['a', 'b', 'c', 'A', 'B', 'C', 'D']
print('list.sort() will sort the elements by ascii code')
names.sort()
print(names)
print('list.sort(key=str.lower) will sort the elements after converting to lower case')
names.sort(key=str.lower)
print(names)

print('list.sort(key=str.upper) will sort the elements after converting to upper case')
names.sort(key=str.upper)
print(names)

print('list.sort(key=str.upper, reverse=False) will sort the elements after converting to upper case in asceding order')
names.sort(key=str.upper, reverse=False)
print(names)

print('list.sort(key=str.upper, reverse=True) will sort the elements after converting to upper case in descening order')
names.sort(key=str.upper, reverse=True)
print(names)

print('list.count(1) will count the number of 1''s in the list')
print('names.count()', names.count(2))
print('len(list) will give length of the list', len(names))



