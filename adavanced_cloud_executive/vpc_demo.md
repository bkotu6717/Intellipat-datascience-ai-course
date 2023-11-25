# Create VPC, subnets, internet gateway and EC2 instances

VPC
	- Create VPC with CIDR
	- 24.8.0.0/20

Subnets
	- Create 3 subnets out of given CIDR
 		-- Subnet-1 should be public
 		-- 24.8.1.0/24
 	- Subnet-2 should be private
 		-- 24.8.2.0/24
 	- Subnet-3 should be private
 		-- 24.8.3.0/24

Internet Gateway
	- Create internet gateway
	- Attach internet gateway to VPC created above 

Route table
	- Edit the route table
	- Add subnet-1 to route and add ip as 0.0.0.0/0

# Create VPC, subnets, internet gateway, NAT gateway and EC2 instances

VPC
	- Create VPC with CIDR
	- 24.8.0.0/20

Subnets
	- Create 3 subnets out of given CIDR
 		-- Subnet-1 should be public
 		-- 24.8.1.0/24
 	- Subnet-2 should be private
 		-- 24.8.2.0/24
 	- Subnet-3 should be private
 		-- 24.8.3.0/24

Ec2 Instances
	- Launch private and public instances in respective subnets

Internet Gateway
	- Create internet gateway
	- Attach internet gateway to VPC created above

Route table
	- Edit the route table
	- Add subnet-1 to route and add ip as 0.0.0.0/0 and internet gate way created

We should be able to access internet from public instance


Create a NAT gateway for letting the private subnet resources to communicate to internet
	- Attach to VPC

- Route table
	- Create route table
	- Edit the route table
	- Add private subnet and destination as 0.0.0.0/0 and add NAT

- Access the private instance from public instance

# Security in VPC

	- NACLs are used to define the security for VPC
	- the lower the rule number, the higer the priority
	- if you allow the traffic, you have to write rule to deny it as well
	- Security group is a firewall for instance

## Security in VPC demo
	- Create a VPC - 3-tier architecture with CIDR 10.20.0.0/16
	- Create 3 subnets
		- public subnet with name web
		- 2 private subnets with name web and app respectively
	- Launch web1 and web2 instances in web subnet
	- Launch app1 and app2 instances in app subnet
	- Launch db1 instance in db subnet
	- web1 and web2 are basic httpd servers and should be connectable from internet on ports 22 and 80 alone
	- app1 and app2 should only be connected from web1 and web2 using private IP addresses over port 22
	- db1 should be connectable from app1 and app2 using private IP addresses over port 22

## VPC peering
	- Create connection bettween 2 VPCs
	- The VPCs are one public and one private
	- CIRD 10.0.0.0/16 and 10.1.0.0/16

### VPC #1
	Attach internet gateway to Public VPC
	Launch instance in public
	add SSH to security group
	Add HTTP to security group

	Launch instance in private instance

### VPC #2
	Launch private instance

### Try to connect to private instance in VPC2 from VPC1 private instance
	- Connection wont work since they are not connected
	- Create a VPC peering between VPC1 and VPC2
	- Create a route table in VPC1 and give destination as VPC2 private subnet CIDR and VPC peer
	- Create a route table in VPC2 and give destination as VPC1 private subnet CIDR and VPC Peer

	Now the connection will be successful

# VPC Pricing

# AWS Transit Gateway

	- Is a central hub that connects your onpremise and Amazon Virtual private coluds
	- Simplifies your network and eliminates complicated peering relationships
	- it functions as a cloud router, establishing new connections only once
	- One transit gateway enough for one region

## Within Region
VPC1 and VPC2 in region1
VPC1
	- One public subnet
	- One private subnet
VPC2
	- One private subnet

Create Transit gateway
	Create Transit gateway attachment for vpc 1 private
	Create Transit gateway attachment for vpc 2 private

Update the route table
	CIDR and transit gateway attachment for both the private subnets

Now from VPC1 private to VPC2 private connection works
Now from VPC2 private to VPC1 private connection also works

## Across Region
Create VPC in NVirginia with different CIDR than first region
Create 1 private subnet
Launch instance
Create transit gateway
Create attachment of VPC type
Create attachment of type VPC Peer
Accept the request from receivers tgw attachments
Wait until attachment status turns to available

Update routes table with VPC1 CIDR
Update routes table with VPC3 CIDR







Launch instance in VPC3

Create transit gateway
Create transit gateway attachemnt and 
	select the attachment type as VPC peering
	Select region 1
Update the normal route table and connect with VPC1 from VPC3
Update the normal route table and connect with VPC3 from VPC1

Crate transit gatewayt route table
	Create static route for VPC peering


Go to first transit gateway and accept the reqquest


# VPC endpoint
	- Create a VPC with 1 private and one public subnets
	- Launch EC2 instances in both subnets
	- SSH into Public instance and ping private instance and it should go well
	- SSH into private instance from public instance and ping google, it should not work since there is no internet gateway
	- Perfrom `aws s3 ls` command and we will get credentials issue
	- Now create an IAM role with Full S3 Access
	- Attach the role to private ec2 instance from actions sections
	Now perform `aws s3 ls` command in private instance, the command will not execcute
	- Now create a VPC end point and add to the private instance
	- Now perfrom s3 command and it works fine



