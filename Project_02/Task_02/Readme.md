
# Initial:

## Amazon EC2 : 
		- Operating system (Linux), Quantity (4), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (2 TB), Provisioning IOPS (1000), Instance type (c5.9xlarge)
		- Operating system (Linux), Quantity (4), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (2 TB), Provisioning IOPS (1000), Instance type (t3a.xlarge)

## RDS for MySQL :
		- Quantity (2), Storage for each RDS instance (General Purpose SSD (gp2)), Storage amount (250 GB), Additional backup storage (3 TB)

## S3 Storage bucket:
		- S3 Standard storage (5 TB per month)

## Elastic IP:
	    - Number of EC2 instances (2), Number of EIPs per instance (2)	

## VPC:
		- Number of NAT Gateways (2)

## LoadBalancers:
		- Number of Application Load Balancers (2)
		
## Route 53:
		- Number of Elastic Network Interfaces (4)

## Link : https://calculator.aws/#/estimate?id=6336249aec1ea2d4f0e2c92686f6ec98ef2733a0
			

# Reduced:

## Amazon EC2 : 
		- Operating system (Linux), Quantity (4), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (2 TB), Provisioning IOPS (1000), Instance type (m4.large)
		- Operating system (Linux), Quantity (4), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (1 TB), Provisioning IOPS (1000), Instance type (t3.large

## RDS for MySQL :
		- Quantity (2), Storage for each RDS instance (General Purpose SSD (gp2)), Storage amount (250 GB), Additional backup storage (3 TB)

S3 Storage bucket:
		- S3 Standard storage (5 TB per month)

## VPC:
		- Number of NAT Gateways (1)

## LoadBalancers:
		- Number of Application Load Balancers (1)
		
## Route 53:
		- Number of Elastic Network Interfaces (4)
		
## Link : https://calculator.aws/#/estimate?id=edc77b720da19418a8ca66edfe0358128b8a50cd
		
# Increased: 

## Amazon EC2 : 
		- Operating system (Linux), Quantity (8), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (1 TB), Provisioning IOPS (1000), Instance type (t3a.2xlarge)
		- Operating system (Linux), Quantity (8), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (2 TB), Provisioning IOPS (1000), Instance type (m6g.2xlarge)

## RDS for MySQL :
		- Quantity (2), Storage for each RDS instance (General Purpose SSD (gp2)), Storage amount (250 GB), Additional backup storage (3 TB)
		
## S3 Storage bucket:
		- S3 Standard storage (100 TB per month)
		
## VPC:
		- Number of NAT Gateways (1)

## LoadBalancers:
		- Number of Application Load Balancers (1)
		
## Route 53:
		- Number of Elastic Network Interfaces (4)
		
## Link : https://calculator.aws/#/estimate?id=cbeb1c44013f0f1692a2427d474882e16000315f
