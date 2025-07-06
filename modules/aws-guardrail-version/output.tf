output "version" {
  value       = aws_bedrock_guardrail_version.guardrail_version.version
  description = "The version number of the created guardrail."
}
