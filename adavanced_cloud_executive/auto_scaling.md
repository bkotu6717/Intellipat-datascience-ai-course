# Autoscaling assignment

## Problem Statement:

> You work for XYZ Corporation that uses on premise solutions and some limited
> number of systems. With the increase in requests in their application, the load
> also increases. So, to handle the load the corporation has to buy more systems
> almost on a regular basis. Realizing the need to cut down the expenses on
> systems, they decided to move their infrastructure to AWS.
> Tasks To Be Performed:

### 1. Create a web server AMI with Apache 2 server running in it.
Create an EC2 instance with apache instance and update the default page

### 2. Create a launch configuration with this AMI.
Select the running instance and go to 
-> Actions -> Image and templates -> Create Image
Wait until launch template is ready
Once ready you can initate creating launch temaplate

### 3. Use this launch configuration to create an Auto Scaling group with 1
minimum and 3 maximum instances.

Create launch template
- Give name
- Select the AMI you have created in the previous step under My AMIs
- Select the security group that was assigned to instance in step #1
- Create template

#### Now create the ASG
- Select the launch template created in Step #3
- Set the minimum, desired and maximum instances count

> Now there should be 3 instances created if we check in EC2 instances list
