output "guardrail_id" {
  value       = aws_bedrock_guardrail.aws_guardrail.guardrail_id
  description = "The unique identifier of the created guardrail."
}

output "version" {
  value       = aws_bedrock_guardrail.aws_guardrail.version
  description = "The version number of the created guardrail."
}

output "created_at" {
  value       = aws_bedrock_guardrail.aws_guardrail.created_at
  description = "The timestamp indicating when the guardrail was created."
}

output "status" {
  value       = aws_bedrock_guardrail.aws_guardrail.status
  description = "The current status of the guardrail (e.g., ACTIVE, FAILED)."
}

output "guardrail_arn" {
  value       = aws_bedrock_guardrail.aws_guardrail.guardrail_arn
  description = "ARN of the Guardrail."
}
