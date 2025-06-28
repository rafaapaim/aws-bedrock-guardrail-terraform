output "version" {
  value       = aws_bedrock_guardrail_version.guardrail_new_version.version
  description = "The version number of the created guardrail."
}
