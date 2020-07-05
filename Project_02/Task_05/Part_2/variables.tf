# TODO: Define the variable for aws_region

variable "region" {
    description = "The AWS region to use"
    default = "us-west-2"
}

variable "runtime" {
  default = "python3.8"
}

variable "lambda_function_name" {
  default = "greet_lambda"
}

variable "vpc_id" {
   description = "VPC for resource to be created"
   default = "vpc-06ab10bf1208a7836"
}