## Exercise 1 - Deploy Project Environment
 
**_Deliverables for Exercise 1:_**
* **E1T4.txt** - Text file identifying 2 poor security practices with justification. 
 
### Task 1:  Review Architecture Diagram
In this task, the objective is to familiarize yourself with the starting architecture diagram. An architecture diagram has been provided which reflects the resources that will be deployed in your AWS account.
 
The diagram file, title `AWS-WebServiceDiagram-v1-insecure.png`, can be found in the _starter_ directory in this repo.
 
![base environment](AWS-WebServiceDiagram-v1-insecure.png)
 
#### Expected user flow:
- Clients will invoke a public-facing web service to pull free recipes.  
- The web service is hosted by an HTTP load balancer listening on port 80.
- The web service is forwarding requests to the web application instance which listens on port 5000.
- The web application instance will, in turn, use the public-facing AWS API to pull recipe files from the S3 bucket hosting free recipes. An IAM role and policy will provide the web app instance permissions required to access objects in the S3 bucket.
- Another S3 bucket is used as a vault to store secret recipes; there are privileged users who would need access to this bucket. The web application server does not need access to this bucket.
 
#### Attack flow:
- Scripts simulating an attack will be run from a separate instance which is in an un-trusted subnet.
- The scripts will attempt to break into the web application instance using the public IP and attempt to access data in the secret recipe S3 bucket.
 
### Task 2: Review CloudFormation Template
In this task, the objective is to familiarize yourself with the starter code and to get you up and running quickly. Spend a few minutes going through the .yml files in the _starter_ folder to get a feel for how parts of the code will map to the components in the architecture diagram. 
 
Additionally, we have provided a CloudFormation template which will deploy the following resources in AWS:
 
#### VPC Stack for the underlying network:
* A VPC with 2 public subnets, one private subnet, and internet gateways etc for internet access.
 
#### S3 bucket stack:
* 2 S3 buckets that will contain data objects for the application.
 
#### Application stack:
* An EC2 instance that will act as an external attacker from which we will test the ability of our environment to handle threats
* An EC2 instance that will be running a simple web service.
* Application LoadBalancer
* Security groups
* IAM role
 
### Task 3: Deployment of Initial Infrastructure
In this task, the objective is to deploy the CloudFormation stacks that will create the below environment.
 
![base environment](AWS-WebServiceDiagram-v1-insecure.png)
 
 
We will utilize the AWS CLI in this guide, however you are welcome to use the AWS console to deploy the CloudFormation templates.
 
 
#### 1. From the root directory of the repository - execute the below command to deploy the templates.
 
##### Deploy the S3 buckets
```
aws cloudformation create-stack --region us-east-1 --stack-name c3-s3 --template-body file://starter/c3-s3.yml
```
 
Expected example output:
```
{
    "StackId": "arn:aws:cloudformation:us-east-1:4363053XXXXXX:stack/c3-s3/70dfd370-2118-11ea-aea4-12d607a4fd1c"
}
```
##### Deploy the VPC and Subnets
```
aws cloudformation create-stack --region us-east-1 --stack-name c3-vpc --template-body file://starter/c3-vpc.yml
```
 
Expected example output:
```
{
    "StackId": "arn:aws:cloudformation:us-east-1:4363053XXXXXX:stack/c3-vpc/70dfd370-2118-11ea-aea4-12d607a4fd1c"
}
```
 
##### Deploy the Application Stack 
You will need to specify a pre-existing key-pair name.
```
aws cloudformation create-stack --region us-east-1 --stack-name c3-app --template-body file://starter/c3-app.yml --parameters ParameterKey=KeyPair,ParameterValue=<add your key pair name here> --capabilities CAPABILITY_IAM
```
 
Expected example output:
```
{
    "StackId": "arn:aws:cloudformation:us-east-1:4363053XXXXXX:stack/c3-app/70dfd370-2118-11ea-aea4-12d607a4fd1c"
}
```
 
Expected example AWS Console status: 
https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks
 
![Expected AWS Console Status](cloudformation_status.png)
 
#### 2. Once you see Status is CREATE_COMPLETE for all 3 stacks, obtain the required parameters needed for the project.
 
Obtain the name of the S3 bucket by navigating to the Outputs section of the stack:
 
![Outputs Section](s3stack_output.png)
 
Note down the names of the two other buckets that have been created, one for free recipes and one for secret recipes.  You will need the bucket names to upload example recipe data to the buckets and to run the attack scripts.
 
- You will need the Application Load Balancer endpoint to test the web service - ApplicationURL
- You will need the web application EC2 instance public IP address to simulate the attack - ApplicationInstanceIP
- You will need the public IP address of the attack instance from which to run the attack scripts - AttackInstanceIP
 
You can get these from the Outputs section of the **c3-app** stack.
 
![Outputs](outputs.png)
 
#### 3.  Upload data to S3 buckets
Upload the free recipes to the free recipe S3 bucket from step 2. Do this by typing this command into the console (you will replace `<BucketNameRecipesFree>` with your bucket name):
 
Example:  
```
aws s3 cp free_recipe.txt s3://<BucketNameRecipesFree>/ --region us-east-1
```
 
Upload the secret recipes to the secret recipe S3 bucket from step 2. Do this by typing this command into the console (you will replace `<BucketNameRecipesSecret>` with your bucket name):
 
Example:  
```
aws s3 cp secret_recipe.txt s3://<BucketNameRecipesSecret>/ --region us-east-1
```
 
#### 4. Test the application
Invoke the web service using the application load balancer URL:
```
http://<ApplicationURL>/free_recipe
```
You should receive a recipe for banana bread.

The AMIs specified in the cloud formation template exist in the us-east-1 (N. Virginia) region. You will need to set this as your default region when deploying resources for this project.
 
### Task 4:  Identify Bad Practices
 
Based on the architecture diagram, and the steps you have taken so far to upload data and access the application web service, identify at least 2 obvious poor practices as it relates to security. List these 2 practices, and a justification for your choices, in the text file named E1T4.txt.
 
**Deliverables:** 
- **E1T4.txt** - Text file identifying 2 poor security practices with justification.