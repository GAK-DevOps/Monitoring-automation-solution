import boto3

def lambda_handler(event, context):
  # Hardcoded instance ID (replace with your actual ID)
  instance_id = "i-0c3555e7c92585457"

  # Corrected SNS topic ARN (replace if different)
  sns_topic_arn ="arn:aws:sns:us-east-1:970589765450:notification"

  # Restart the EC2 instance
  ec2 = boto3.client('ec2')
  ec2.reboot_instances(InstanceIds=[instance_id])

  # Log the action
  print(f"Rebooted EC2 instance: {instance_id}")


  # Send notification
  sns = boto3.client('sns')
  print(f"SNS Topic ARN: {sns_topic_arn}")
  sns.publish(
    TopicArn=sns_topic_arn,
    Message=f"Rebooted EC2 instance: {instance_id}",
    Subject="EC2 Instance Rebooted",
  )

  return {
    'statusCode': 200,
    'body': f"Rebooted EC2 instance: {instance_id}"
  }
