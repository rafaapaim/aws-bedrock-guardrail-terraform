variable "name" {
  description = "The name of the inference profile."
  type        = string
  default     = "Amazon Nova Lite for Project Example"
}

variable "description" {
  description = "The description of the inference profile."
  type        = string
  default     = "Profile with tag for cost allocation tracking"
}

variable "tags" {
  description = "Key-value mapping of resource tags for the inference profile."
  type        = map(string)
  default     = {
    ProjectID = "ProjectExample"
  }
}

variable "copy_from" {
  description = "The Amazon Resource Name (ARN) of the model to copy from."
  type        = string
  default     = "arn:aws:bedrock:us-east-1::foundation-model/amazon.nova-lite-v1:0"
}

