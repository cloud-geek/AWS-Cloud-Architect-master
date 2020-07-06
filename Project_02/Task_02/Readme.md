
# Initial:

Amazon EC2 : 
		- Operating system (Linux), Quantity (4), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (2 TB), Provisioning IOPS (1000), Instance type (c5.9xlarge)
		- Operating system (Linux), Quantity (4), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (2 TB), Provisioning IOPS (1000), Instance type (t3a.xlarge)

RDS for MySQL :
		- Quantity (2), Storage for each RDS instance (General Purpose SSD (gp2)), Storage amount (250 GB), Additional backup storage (3 TB)

S3 Storage bucket:
		- S3 Standard storage (5 TB per month)

Elastic IP:
	    - Number of EC2 instances (2), Number of EIPs per instance (2)	

VPC:
		- Number of NAT Gateways (2)

LoadBalancers:
		- Number of Application Load Balancers (2)
		
Route 53:
		- Number of Elastic Network Interfaces (4)

Link : https://calculator.aws/#/estimate?id=efe46d5cc9b0cf0e60e59af23b495b688930f70f

Newly added : AWS Data Transfer, Amazon Elastic IP, Network Address Translation (NAT) Gateway, Application Load Balancer

Estimated Cost: Monthly - 9,647.06 USD
			

# Reduced:

Amazon EC2 : 
		- Operating system (Linux), Quantity (4), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (2 TB), Provisioning IOPS (1000), Instance type (m4.large)
		- Operating system (Linux), Quantity (4), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (1 TB), Provisioning IOPS (1000), Instance type (t3.large

RDS for MySQL :
		- Quantity (2), Storage for each RDS instance (General Purpose SSD (gp2)), Storage amount (250 GB), Additional backup storage (3 TB)

S3 Storage bucket:
		- S3 Standard storage (5 TB per month)

VPC:
		- Number of NAT Gateways (1)

LoadBalancers:
		- Number of Application Load Balancers (1)
		
Route 53:
		- Number of Elastic Network Interfaces (4)
		
Link : https://calculator.aws/#/estimate?id=edc77b720da19418a8ca66edfe0358128b8a50cd

## Rationale: 

	- A good performing database backend with read replicas in multi-az single region
	- 4 X EC2 m4.large, 4 X EC2 t3.large 
	- 2 x RDS for MySQL Storage for each RDS instance
	- Removed : Newly added : AWS Data Transfer, Amazon Elastic IP, Network Address Translation (NAT) Gateway, Application Load Balancer

Estimated Cost: Monthly - 6,311.74 USD

# Increased: 

Amazon EC2 : 
		- Operating system (Linux), Quantity (8), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (1 TB), Provisioning IOPS (1000), Instance type (t3a.2xlarge)
		- Operating system (Linux), Quantity (8), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (2 TB), Provisioning IOPS (1000), Instance type (m6g.2xlarge)

RDS for MySQL :
		- Quantity (2), Storage for each RDS instance (Provisioned IOPS SSD (io1)), Storage amount (1500 GB), Instance type (db.m5.12xlarge), Additional backup storage (5 TB), Provisioning IOPS (1000)
		
S3 Storage bucket:
		- S3 Standard storage (100 TB per month)
		
VPC:
		- Number of NAT Gateways (1)

LoadBalancers:
		- Number of Application Load Balancers (1)
		
Route 53:
		- Number of Elastic Network Interfaces (4)
		
Link : https://calculator.aws/#/estimate?id=cc93e87325e1ee2e07cb5576f5ff89b522ad6309

## Rationale: 

- Extremely performing database backend with read replicas win multi-az single region
	- 8 X EC2 t3a.2xlarge, 8 X EC2 m6g.2xlarge 
	- Added 2 more replicas to RDS storage/size to handle more read workload. Instance also updated to better fitting one.

Estimated Cost: Monthly - 19,849.50 USD
