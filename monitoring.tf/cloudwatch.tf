resource "aws_cloudwatch_metric_alarm" "high_5xx_errors" {
  alarm_name          = "High5xxErrors"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "5xxErrorRate"
  namespace           = "AWS/CloudFront"
  period              = 300
  statistic           = "Sum"
  threshold           = 10
  alarm_description   = "Triggers when 5xx errors exceed threshold"
  dimensions = {
    DistributionId = aws_cloudfront_distribution.this.id
  }
  alarm_actions = [aws_sns_topic.alerts.arn]
}