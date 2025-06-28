resource "aws_bedrock_guardrail_version" "guardrail_new_version" {
  guardrail_arn = var.guardrail_arn
  description   = var.description
  skip_destroy  = var.skip_destroy
}