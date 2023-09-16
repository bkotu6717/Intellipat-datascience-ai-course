print('sachin is a good player')
print("sachin is a good player")
print("sachin is a 'good' player")
print('sachin is a "good" player')
print("""'sachin' is a "good" player""")

first_name = 'Bhaskar'
last_name = 'Kotu'
profession = 'Sr Software engineer'

print('---------------------- formatted strings ----------------------')
print(f"{first_name} {last_name} is a {profession}")

# age = input('enter age')
# print('age -> ', age)


# age = int(input('enter age'))
# print('age type is ', type(age))
# print('age -> ', age)

print('by', 'default', 'print', 'method', 'prints', 'all', 'the', 'values', 'seperated', 'by', 'space')
print('by', 'default', 'print', 'method', 'prints', 'all', 'the', 'values', 'seperated', 'by', 'space', sep='-')
print('by', 'default', 'print', 'method', 'prints', 'all', 'the', 'values', 'seperated', 'by', 'space', sep='-', end=' ')


print('\n---------------------- string methods ----------------------')
name = 'Bhaskar'
print('name: ', name)
print('len(name):', len(name))

print('---------------------- strings are immutable ----------------------')
name = 'Bhaskar'
print('id(name)', id(name))
name = 'Bhaskar K'
print('id(name) after reassignemnt' , id(name))
print('Use replace method to update the strings')
name = name.replace('B', 'K')
print('id(name)', id(name))

print('name.lower()', name.lower())
print('name.upper()', name.upper())
print('name.capitalize()', name.capitalize())
str = '        god of war      '
print('strip() removes extra white spaces by default at the begining and end of string')
print('str length before strip: ',len(str))
print('str length after strip: ',len(str.strip()))

print('strip() can accept params')
print('jjjjjjjBhaskarjjjjjjjjjj.strip("j"): ', 'jjjjjjjBhaskarjjjjjjjjjj'.strip("j"))
print('jjjjjjjBhaskarjjjjjjjjjj.lstrip("j"): ', 'jjjjjjjBhaskarjjjjjjjjjj'.lstrip("j"))
print('jjjjjjjBhaskarjjjjjjjjjj.rstrip("j"): ', 'jjjjjjjBhaskarjjjjjjjjjj'.rstrip("j"))









