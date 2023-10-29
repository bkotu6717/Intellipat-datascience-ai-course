import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
data = pd.read_csv('./employe.csv')
print(data)
print(data.to_string()) # Print all the rows of csv file

Check the quality of the data

# Print top 5 rows
print(data.head(5))

# Print bottom 5 records
print(data.tail(6))

# Check for shape (number of rows and columns)
print(data.shape)

# Find the data type of columns
print(data.info())

# Clean our data
# clean duplicates, NULL values and remove impurites etc
print(data.isnull().sum())
print(data.isna().sum())
print(data[data.duplicated()])

# remove dupliate data
print(data.to_string()) # Print all the rows of csv file
print(data[data.duplicated()])
data = data.drop_duplicates(keep='first')
# print(data) # Print all the rows of csv file

print(data.corr(numeric_only = True, method ='pearson'))
# Data is ready for analysis
corr = data.corr(numeric_only = True, method ='pearson')
map_data = sns.heatmap(corr,cmap='Greens')
print(map_data.get_figure().show())


