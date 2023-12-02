
# FSX for windows server

se

training.fsx

- Create Active directory
- Create Amazon FSX
- Create Windows EC2 Instance - with FSX AZ
	- Control pannel
	- Network and internet
	- Network and sharing center
	- Change adapter settings
	- Ethernet
	- Right Click
	TCP/IP V4 -open
	- Use the following DNS server address
		- Preferred DNS server
		- Alternate DNS server
		- get the DNS info from Active Directory

	System and security
		- Advanced System settings
		- Computer name
		- Click on change
		- Member of: provide the domain name from active directory
		- Wait for confirmation popup


sudo amazon-linux-extras install -y lustre2.10
