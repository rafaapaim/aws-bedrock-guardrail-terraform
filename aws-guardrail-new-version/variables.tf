variable "guardrail_arn" {
  description = "ARN do Guardrail"
  type        = string
  default     = "arn:aws:bedrock:us-east-1:339388549607:guardrail/7g0he963bq9u"
}

variable "description" {
  description = "Description of the Guardrail version."
  type        = string
  default     = "New version of the Guardrail"
}

variable "skip_destroy" {
  description = "Whether to retain the old version of a previously deployed Guardrail. Default is false."
  type        = bool
  default     = true
}