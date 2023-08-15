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
# d - stands for directory
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

# Find currently logged in user
whoami

# Install ngnix
apt install nginx

# Check running processes created by user
ps
# Check all the running processing created by system as well
ps -e

# See the terminal command history
history

# Clear the termmial command history
history -p # On Mac
history -c # On Ubuntu 
history -d 3 # Deletes 3rd command in history

# Set permissions
# chmod 
# r w x - read write execute
# 0 0 0 - No permission
# 0 0 1 - Only execute
# 0 1 0 - Only write
# 1 0 0 - Only read
# 0 1 1 - Only write and execute
# 1 1 0 - Only read and write
# 1 1 1 - Read, Write and Execute

chmod 111 file1 - sets all permissions
chmod +rwx file1 -sets all the permissions


# Man command helps you to get help on given command
man ls

# Grep gets pattern matching data
cat file1
# line1
# line2
# lin3

# hello
# Hello
# HELLO WORLD
# HEELOWORLD
grep -w HELLO file1
# Gives lines with words HELLO
# HELLO WORLD
grep -i HELLO file1
# Gets words with case insestive match

