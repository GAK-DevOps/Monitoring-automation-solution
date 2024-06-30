Monitoring and Automation Solution Overview
This repository contains a monitoring and automation solution designed to identify and resolve intermittent performance issues in a web application using Sumo Logic for log analysis, AWS Lambda for automation, and Terraform for infrastructure management.

Sumo Logic Query and Alert
Sumo Logic Query File: sumo_logic_query.txt
Description: Contains the Sumo Logic query to identify log entries where the response time of the /api/data endpoint exceeds 3 seconds.
Alert Creation
Description: An alert triggers if more than 5 such entries are detected within a 10-minute window.
Screen and Audio Recording Link: Recording Link
AWS Lambda Function
Lambda Function Implementation Directory: lambda_function/
Description: Contains the Python code for the AWS Lambda function.
Functionality: Restarts a specified EC2 instance, logs the action, and sends a notification to an SNS topic triggered by the Sumo Logic alert.
Deployment and Testing
Description: Lambda function deployment using AWS Management Console or CLI.
Verification: Testing to ensure the Lambda function restarts the EC2 instance and sends the notification.
Screen and Audio Recording Link: Recording Link
Infrastructure as Code (IaC) Setup
Terraform Configuration Directory: terraform/
Description: Terraform scripts to deploy the EC2 instance, Lambda function, and SNS topic.
Optional/Bonus: Resources created with the least privilege necessary.
Deployment and Verification
Description: Deploying infrastructure using Terraform and verifying correct resource creation and Lambda function functionality.
Screen and Audio Recording Link: Recording Link
