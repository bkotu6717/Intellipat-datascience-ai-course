print('----------------- sets demo ---------------')
print('duplicates are not allowed, not indexed and mutable')
set1 = set
set2 = {}
set3 = {'one': 1, 'two': 2, 'three': 3, 'four': 4}
print('set1=set', set1)
print('set2={}', set2)
print('set3: ', set3)
print("{'one': 1} is a dictionary type: ", type(set3))
print("{} is a dictionary type: ", type(set2))

set4 = {1,2,3,4,5,6,7,7,8,9}

# print(f("{set4} is a set type"), type(set4))


data = range(1,10)
print(data)
print(list(data))
print(type(data))
print(list(range(-1,-10, -1)))
print(list(range(20, 0, -1)))
print(list(range(10)))