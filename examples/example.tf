resource "aws_sns_topic" "sns_topic" {
  name         = "sns"
  display_name = "sns"
}
module "cost-anomaly-detector" {
  source                 = "../"

subscribers = [
  { type = "SNS", address = aws_sns_topic.sns_topic.arn },
  { type = "EMAIL", address = "example@example.com" }
]
  create_anomaly_monitor = true
  raise_amount_percent   = "10"
  raise_amount_absolute  = "15"
  resource_tags = {
    Environment = "global"
    Terraform   = "true"
  }
  depends_on        = [aws_sns_topic.sns_topic]
}

