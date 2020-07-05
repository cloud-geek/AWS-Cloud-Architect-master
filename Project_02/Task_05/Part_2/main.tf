provider "aws" {
  # Updated with dummy key before uploading the code into github
  access_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  region = "${var.region}"
}

resource "aws_instance" "UdacityT2" {
  count = "4"
  ami = "ami-0a243dbef00e96192"
  instance_type = "t2.micro"
  tags = {
    name = "Udacity T2"
  }
}

resource "aws_instance" "UdacityM4" {
  count = "2"
  ami = "ami-0a243dbef00e96192"
  instance_type = "m4.large"
  tags = {
    name = "Udacity M4"
  }
}

data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = "lambda.zip"
  source_file = "greet_lambda.py"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 14
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for Lambda logging"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

resource "aws_lambda_function" "greet_lambda" {
  filename         = "lambda.zip"
  function_name    = var.lambda_function_name
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "greet_lambda.lambda_handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  depends_on       = [aws_iam_role_policy_attachment.lambda_logs, aws_cloudwatch_log_group.lambda_logs]

  runtime = var.runtime
  environment {
    variables = {
      greeting = "Hello, World!"
    }
  }
}