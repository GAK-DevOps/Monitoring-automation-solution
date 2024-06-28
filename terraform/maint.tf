provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_instance" {
  ami           = "ami-01b799c439fd5516a"
  instance_type = "t2.micro"

  tags = {
    Name = "AppInstance"
  }
}

resource "aws_sns_topic" "reboot_notifications" {
  name = "reboot-notifications"
}

resource "aws_lambda_function" "reboot_instance" {
  filename         = "lambda_function.zip"
  function_name    = "reboot_instance"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "lambda_function.lambda_handler"
  source_code_hash = filebase64sha256("lambda_function.zip")
  runtime          = "python3.8"
  environment {
    variables = {
      INSTANCE_ID    = aws_instance.app_instance.id
      SNS_TOPIC_ARN  = aws_sns_topic.reboot_notifications.arn
    }
  }
}

resource "aws_lambda_permission" "allow_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.reboot_instance.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.reboot_notifications.arn
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_lambda_exec" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:ec2:us-east-1:970589765450:instance/i-04a7ec32fd94334eb"
}
