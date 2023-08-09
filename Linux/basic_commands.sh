# Creates a directory called demo
mkdir demo

# List all the files and folders in a given location or current location
ls

# Jump into a directory
cd demo

# Get current working directory
pwd

# Create nested directories
# Here flag -p helps to create parent directory if it does not exists
# If directory does exists, it just ignores without throwing any error
mkdir -p a/b/b1 a/c

# Brings to home directory from which ever is current location
cd

# Come back by one directory level
cd ..

# Come back by two directory level
cd ../..

# See more details about files and folders
ls -l

# drwxr-xr-x   7 admin  staff   224 Aug  9 07:24 Intellipat-datascience-ai-course
# d- stands for directory
# for a file it will be _

# Lists the hidden files as well
ls -a

# Create files
touch file1 file2

# Writes data to file
echo "Hello" > file1

# Overrides previous content
echo "Hello world" > file1

# Enter multiple lines of data
echo "line1\nline2\nlin3" > file1
echo "Line 1
line 2
line 3
line 4" > file1

# Appends the data to existing file content
echo "hello \n world" >> file1

# Creates file if it does not exists
echo "WOw" > file4

# Delete a file
rm file1

# Delete a directory
rm -rf directory


