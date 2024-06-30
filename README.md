# Monitoring and Automation Solution

## Sumo Logic Query and Alert
- **Query**: Identify log entries where the response time of the `/api/data` endpoint exceeds 3 seconds.
- **Alert**: Trigger an alert if more than 5 such entries are detected within a 10-minute window.

## AWS Lambda Function
- **Function**: Python AWS Lambda function that restarts a specified EC2 instance, logs the action, and sends a notification to an SNS topic.
- **Deployment**: Deployed using AWS Management Console or CLI.
- **Testing**: Verified that the function restarts the EC2 instance and sends the notification.

## Terraform Configuration
- **Infrastructure**: Terraform script to deploy the EC2 instance, Lambda function, and SNS topic.
- **Deployment**: Deployed using `terraform apply`.
- **Verification**: Confirmed that all resources are created and function as expected.

## Screen and Audio Recordings
- Part 1: [Link to recording](./recordings/part1.mp4)
- Part 2: [Link to recording](./recordings/part2.mp4)
- Part 3: [Link to recording](./recordings/part3.mp4)
