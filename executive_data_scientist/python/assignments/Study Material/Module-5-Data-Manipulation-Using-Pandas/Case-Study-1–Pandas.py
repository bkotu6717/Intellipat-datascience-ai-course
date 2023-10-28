# # Problem Statement:
# # You work in XYZ Company as a Python developer. The company officials want
# # you to build a Python program.

# Tasks To Be Performed:
# 1. Write a function that takes start and end of a range returns a pandas series
# object containing numbers within that range.

import pandas as pd

def range_series(start=1, end=10):
  return pd.Series(range(start, end+1))

print(range_series(1,4))
print(range_series())

# # In case the user does not pass start or end or both they should default to 1
# # and 10 respectively. E.g:
# -> range_series() -> Should Return a pandas series from 1 to 10
print(range_series())

# range_series(5) -> Should Return a pandas series from 5 to 10
print(range_series(5))

# range_series(5, 10) -> Should Return a pandas series from 5 to 10
print(range_series(5,10))

# Create a method that takes n NumPy arrays of the same dimensions,
# sums them and returns the answer.

import numpy as np
def create_numpy_array(dimensions, default_value):
  return np.full(dimensions, default_value)

def sum_numpy_arrays(*args):
  sum_matrix = args[0]
  for x in args[1:]:
    sum_matrix = np.add(sum_matrix, x)
  return sum_matrix

np_arrays = []
for x in range(1,6):
  np_arrays.append(create_numpy_array((3,3), x))
print(sum_numpy_arrays(*np_arrays))


# 2. Create a function that takes in two lists named keys and values as
# arguments
# Keys would be strings and contain n string values
# Values would be a list containing n lists
# The methods should return a new pandas DataFrame with keys as column
# names and values as their corresponding values, e.g:
# ->create_dataframe(["One", "Two"], [["X", "Y"], ["A", "B"]]) -> should return a
# data frame
# One Two
# 0 X A
# 1 Y B

def createDataFrame(keys, values):
  dictionary = {}
  for x in range(0,len(keys)):
    dictionary[keys[x]] = values[x]

  return pd.DataFrame(dictionary)

print(createDataFrame(["One", "Two"], [["X", "Y"], ["A", "B"]]))

# 3. Create a function that concatenates two DataFrames. Use a previously
# created function to create two DataFrames and pass them as parameters
# Make sure that the indexes are reset before returning.

def concat_data_frames(df1, df2):
  return pd.concat([df1, df2], ignore_index=True).reset_index()

df1 = pd.DataFrame({'One': ['X', 'Y']})
df2 = pd.DataFrame({'Two': ['A', 'B']})
print(concat_data_frames(df1, df2))

# 4. Write code to load data from cars.csv into a dataframe and print its details.
# Details like: 'count', 'mean', 'std', 'min', '25%', '50%', '75%', 'max'.
# df = pd.read_csv('./mtcars.csv')
# print(df.describe())
# 5. Write a method that will take a column name as argument and return the
# name of the column with which the given column has the highest correlation.
# The data to be used is the cars dataset.
# The returned value should not the column named that was passed as the
# parameters, e.g. : get_max_correlated_column('mpg') -> should return 'drat

def get_max_correlated_column(col):
  df = pd.read_csv('./CASE-STUDY-1--PANDAS-27OCT2023063616/cars.csv')
  df = df.drop(['model', 'S.No'], axis=1)
  rs = df.corr(numeric_only = True, method ='pearson')
  return rs[col].sort_values(ascending=False).keys()[1]

print(get_max_correlated_column('gear'))
