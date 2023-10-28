# Problem Statement:
# You work in XYZ Corporation as a Data Analyst. Your corporation has told you to
# analyze the customer_churn dataset with various functions.

# Tasks To Be Performed:
# 1. Start off by importing the customer_churn.csv file in the jupyter notebook
# and store that in churn DataFrame.

import pandas as pd
churn_df = pd.read_csv('./customer_churn.csv')
print(churn_df)

# 2. From the churn DataFrame, select only 3rd, 7th, 9th, and 20th columns
# and all the rows and store that in a new DataFrame named newCols.
newCols = churn_df.iloc[:, [3,7,9,20]]
print(newCols)

# 3. From the original DataFrame, select only the rows from the 200th index till
# the 1000th index(inclusive) row.
new_df = churn_df.iloc[200:1001]

# 4. Now select the rows from 20th index till 200th index(exclusive),and
# columns from 2nd index till 15th index value.
print(churn_df.iloc[20:200, 2:15])
# print(new_df.iloc[20:200, 2:15])

# 5. Display the top 100 records from the original DataFrame.
print(churn_df.head(100))
# 6. Display the last 10 records from the DataFrame.
print(churn_df.tail(10))

# 7. Display the last record from the DataFrame.
print(churn_df.tail(1))

# 8. Now from the churn DataFrame, try to sort the data by the tenure column
# according to the descending order.
print(churn_df.sort_values('tenure', ascending=False))

# 9. Fetch all the records that are satisfying the following condition:
# a. Tenure>50 and the gender as ‘Female’
filter_data = (churn_df['tenure'] > 50) & (churn_df['gender'] == 'Female')

print(churn_df[filter_data])
# b. Gender as ‘Male’ and SeniorCitizen as 0
filter_data = (churn_df['gender'] == 'Male') & (churn_df['SeniorCitizen'] == 0)
print(churn_df[filter_data])

# c. TechSupport as ‘Yes’ and Churn as ‘No’
filter_data = (churn_df['TechSupport'] == 'Yes') & (churn_df['Churn'] == 'No')
print(churn_df[filter_data])

# d. Contract type as ‘Month-to-month’ and Churn as ‘Yes’
filter_data = (churn_df['Contract'] == 'Month-to-month') & (churn_df['Churn'] == 'Yes')
print(churn_df[filter_data])

# 10. Use a for loop to calculate the number of customers that are getting the
# tech support and are male senior citizens
filter_data = (churn_df['TechSupport'] == 'Yes') & (churn_df['gender'] == 'Male') & (churn_df['SeniorCitizen'] == 1)
print(churn_df[filter_data]['gender'].count())



