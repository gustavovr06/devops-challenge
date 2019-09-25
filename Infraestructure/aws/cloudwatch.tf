resource "aws_cloudwatch_log_group" "log_container" {
  name              = "log_container"
  retention_in_days = 1
}
