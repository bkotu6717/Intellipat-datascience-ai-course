# Create an instance with a region
> Take note of launch wizard
> eg: launch-wizard-4
> Install apache2 web server
	```
	#!/bin/bash
	sudo apt update
	sudo apt install apache2
	cd /var/www/html
	sudo rm index.html
	sudo touch index.html
	sudo nano index.html
	```

## Allow all the traffic from security groups inbound rule

>> Create EFS 
>> Change the mount targets to launch wizard in instance 
>> eg: launch-wizard-4 as created for the instance


# Install necessary tools in ec2 isntance
# Install nfs-common tool

```
sudo apt-get install nfs-common -y # Ubuntu
sudo yum -y install nfs-utils # Amazon linux
```

# Create a directory to mouting

```
mkdir efs-dir
```

# Attach
# Execute mounting commands as per efs attach

# You can add one more instance and atttach the same efs to it

# Efs is mountable to all instances in same region

