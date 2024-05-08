data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda_code.py"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "send_email" {
  filename         = "lambda_function_payload.zip"  
  function_name    = "send_email"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.handler" 
  runtime          = "python3.10"

  environment {
    variables = {
      SES_SENDER_EMAIL    = var.ses_email_reciever
      SES_RECIPIENT_EMAIL = var.ses_email_reciever
    }
  }
}