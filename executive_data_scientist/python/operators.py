print('------------------ Assignment Operators =, +=, -=, /=, //=, %/ ---------------------')
print("= is an assignment operator")
print(" num = 10")
print(" 10 is assigned to num 10")
print(' num += 10')
print(' num -= 10')
print(' +=, -= is a called shorthand operator')
print('10**5 is an exponential operator')
print(10**5, ' is the value of 10**5')

print('------------------ Comparision Operators <, >, <=, >=, ==, != ---------------------')
print('1 > 2 = ', 1 > 2)
print('1 < 2 = ', 1 < 2)
print('1 >= 2 = ', 1 >= 2)
print('1 <= 2 = ', 1 <= 2)
print('1 != 2 = ', 1 != 2)
print('1 == 2 = ', 1 == 2)
print('True will be type casted to integer and the value is going to be 1')
print('True + 1 = ', True + 1)
print('False will be type casted to integer and the value is going to be 0')
print('False + 1 = ', False + 1)
print('False > 1 = ', False > 1)
print('True > 1 = ', True > 1)
print('True > False = ', True > False)


print('------------------ predefined Keywords ---------------------')
print(help('keywords'))

print('------------------ type casting ---------------------')
print('int(True) = ', int(True))
print('int(False) = ', int(False))
print('int(bool) = ', int(bool(0)))
print('except bool(0) eveyother value for bool(x) returns true')
print('int(bool) = ', int(bool(1)))

print('------------------ Logical operators and, or, not ---------------------')
print('In python we dont use &&, || kind of operators, we use and, or and not')
voter_id = True
age = 17
print('voter_id and (age > 17) = ', voter_id and (age > 17))
print('not(age > 17) = ', not(age > 17))

print('------------------ Identity operators ---------------------')
num1 = 1
num2 = 1
print('num1 = ', num1)
print('num2 = ', num2)
print('id(num1)', id(num1))
print('id(num2)', id(num2))
print('num1 is num2', num1 is num2)

num1 = 256
num2 = 256
print('num1 = ', num1)
print('num2 = ', num2)
print('id(num1)', id(num1))
print('id(num2)', id(num2))
print('num1 is num2', num1 is num2)


num1 = 257
num2 = 257
print('num1 = ', num1)
print('num2 = ', num2)
print('id(num1)', id(num1))
print('id(num2)', id(num2))
print('num1 is num2', num1 is num2)


num1 = 258
num2 = 258
print('num1 = ', num1)
print('num2 = ', num2)
print('id(num1)', id(num1))
print('id(num2)', id(num2))
print('num1 is num2', num1 is num2)


print('------------------ membership operators (in)---------------------')
word = 'India'
news = 'World cup winner of 2023 is India'
print('word = ', word)
print('news = ', news)

print('word in news = ', word in news)

print('------------------ bitwise operators (&, |, ^, <<, >>) performs and AND or gate operations---------------------')
print(' 0 & 0 = ', 0 & 0)
print(' 1 & 0 = ', 1 & 0)
print(' 1 & 1 = ', 1 & 1)
print(' 1 & 2 = ', 1 & 2)

print(' 0 | 0 = ', 0 | 0)
print(' 1 | 0 = ', 1 | 0)
print(' 1 | 1 = ', 1 | 1)
print(' 1 | 2 = ', 1 | 2)

print(' 20 | 25 = ', 20 | 25)

print(' 20 ^ 25 = ', 20 | 25)

print(' 1 << 1 moves bits left by 1 position')
print(' 1 << 2 moves bits left by 2 positions')

print(' 1 << 2 = ', 1 << 2) 
print(' 1 >> 2  = ', 1 >> 2)
print(' 1 >> 100  = ', 1 >> 100)
print(' 1 << 100  = ', 1 << 100)
