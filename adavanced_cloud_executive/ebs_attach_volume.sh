sudo apt-get update

# Shows all the mounted volumes, if mounted it will show UUID fo volume
lsblk

# Same as lsblk
sudo file -s /dev/xvdf

# Create a file system with the volume
sudo mkfs -t ext4 /dev/xvdf

# Check if volume was created with UUID 
lsblk

# create a folder, so that we can mount ebs volume
sudo mkdir ebsvolume

# Mount the ebs volume on the folder we created
sudo mount /dev/xvdf ebsvolume

# Check if mounting is sucessful
lsblk
df -h

# Unmount the created volume
sudo umount /dev/xvdf