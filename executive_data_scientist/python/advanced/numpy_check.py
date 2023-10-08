import numpy as np
print(np.__version__)

nums = [10, True, 'vasanth', 10.5]
nums = np.array(nums)
print(nums)
nums_list = [1,2,3,4,6]
nums = np.array(nums_list)
print(nums)
print(type(nums))

print(nums.dtype)
print(nums[0], nums[1], nums[2])


nums = np.array(nums_list, dtype='int32')
print(nums.dtype)
print(nums.itemsize, 'bytes')
print(nums.shape)
print(nums.ndim)
print(nums.shape)
print(len(nums), 'is total number of rows')



nums = np.array(nums_list, dtype='int64')
print(nums.dtype)
print(nums.itemsize, 'bytes')
print(nums.shape)
print(nums.ndim)
print(nums.shape)



nums = np.array(nums_list, dtype='float64')
print(nums.dtype)
print(nums.itemsize, 'bytes')
print(nums.shape)
print(nums.ndim)
print(nums.shape)
