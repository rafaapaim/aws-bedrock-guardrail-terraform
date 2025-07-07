output "arn" {
  description = "The Amazon Resource Name (ARN) of the inference profile."
  value       = aws_bedrock_inference_profile.inference_profile.arn
}

output "id" {
  description = "The unique identifier of the inference profile."
  value       = aws_bedrock_inference_profile.inference_profile.id
}

output "name" {
  description = "The unique identifier of the inference profile."
  value       = aws_bedrock_inference_profile.inference_profile.name
}

output "models" {
  description = "A list of information about each model in the inference profile."
  value       = aws_bedrock_inference_profile.inference_profile.models
}

output "status" {
  description = "The status of the inference profile. ACTIVE means that the inference profile is available to use."
  value       = aws_bedrock_inference_profile.inference_profile.status
}

output "type" {
  description = "The type of the inference profile. SYSTEM_DEFINED or APPLICATION."
  value       = aws_bedrock_inference_profile.inference_profile.type
}

output "created_at" {
  description = "The time at which the inference profile was created."
  value       = aws_bedrock_inference_profile.inference_profile.created_at
}

output "description" {
  description = "The description of the inference profile."
  value       = aws_bedrock_inference_profile.inference_profile.description
}

output "updated_at" {
  description = "The time at which the inference profile was last updated."
  value       = aws_bedrock_inference_profile.inference_profile.updated_at
}

# Optional: outputs for model_arn inside models block
output "model_arns" {
  description = "A list of model ARNs from the inference profile."
  value       = [for model in aws_bedrock_inference_profile.inference_profile.models : model.model_arn]
}

