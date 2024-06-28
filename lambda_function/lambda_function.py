import boto3
import os

ec2 = boto3.client('ec2')
sns = boto3.client('sns')

def lambda_handler(event, context):
    instance_id = os.getenv('i-04a7ec32fd94334eb')
    sns_topic_arn = os.getenv('arn:aws:ec2:us-east-1:970589765450:instance/i-04a7ec32fd94334eb')
    
    # Restart the EC2 instance
    ec2.reboot_instances(InstanceIds=[instance_id])
    
    # Log the action
    print(f"Rebooted EC2 instance: {instance_id}")
    
    # Send notification
    sns.publish(
        TopicArn=sns_topic_arn,
        Message=f"Rebooted EC2 instance: {instance_id}",
        Subject="EC2 Instance Rebooted"
    )
    
    return {
        'statusCode': 200,
        'body': f"Rebooted EC2 instance: {instance_id}"
    }
