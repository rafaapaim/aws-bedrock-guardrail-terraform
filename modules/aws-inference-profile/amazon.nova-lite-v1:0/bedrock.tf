data "aws_caller_identity" "current" {}

resource "aws_bedrock_inference_profile" "inference_profile" {
  name        = var.name
  description = var.description

  model_source {
    copy_from = var.copy_from

    # Include account ID to use inference profiles
    # copy_from = "arn:aws:bedrock:eu-central-1:${data.aws_caller_identity.current.account_id}:inference-profile/eu.anthropic.claude-3-5-sonnet-20240620-v1:0"
  }

  tags = {
    ProjectID = var.tags["ProjectID"]
  }
}