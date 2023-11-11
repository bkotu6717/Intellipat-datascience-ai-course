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

















