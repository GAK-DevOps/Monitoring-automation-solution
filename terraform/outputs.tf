output "i-04a7ec32fd94334eb" {
  value = aws_instance.app_instance.id
}

output "arn:aws:ec2:us-east-1:970589765450:instance/i-04a7ec32fd94334eb" {
  value = aws_sns_topic.reboot_notifications.arn
}
