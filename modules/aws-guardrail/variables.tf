variable "name" {
  description = "The name of the guardrail resource."
  type        = string
  default     = "guardrail_example"
}

variable "blocked_input_messaging" {
  description = "Message displayed when user input is blocked by the guardrail."
  type        = string
  default     = "Input has been blocked by the guardrail. Please rephrase your request."
}

variable "blocked_outputs_messaging" {
  description = "Message displayed when model output is blocked by the guardrail."
  type        = string
  default     = "Output has been blocked by the guardrail. Please try again with a different request."
}

variable "description" {
  description = "A description of the guardrail resource."
  type        = string
  default     = "Guardrail created by Terraform"
}

variable "kms_key_arn" {
  description = "ARN of the KMS key used for encryption. If empty, the default key is used."
  type        = string
  default     = null
}

variable "contextual_grounding_policy_config" {
  description = "Configuration map for contextual grounding policies, ensuring responses are based on provided context."
  type        = map(string)
  default     = {}
}

variable "filters_config" {
  description = "Configuration list defining content policy parameters."
  type = list(object({
    type            = string
    input_strength  = string
    output_strength = string
  }))
  default = [
    {
      type            = "SEXUAL"
      input_strength  = "HIGH"
      output_strength = "HIGH"
    },
    {
      type            = "VIOLENCE"
      input_strength  = "HIGH"
      output_strength = "HIGH"
    },
    {
      type            = "HATE"
      input_strength  = "HIGH"
      output_strength = "HIGH"
    },
    {
      type            = "INSULTS"
      input_strength  = "HIGH"
      output_strength = "HIGH"
    },
    {
      type            = "MISCONDUCT"
      input_strength  = "HIGH"
      output_strength = "HIGH"
    },
    {
      type            = "PROMPT_ATTACK"
      input_strength  = "HIGH"
      output_strength = "NONE"
    }
  ]
}

variable "sensitive_information_policy_config" {
  description = "Sensitive information policy configuration"
  type = object({
    pii_entities_config = optional(list(object({
      action = string
      type   = string
    })))
    regexes_config = optional(list(object({
      action      = string
      description = string
      name        = string
      pattern     = string
    })))
  })
  default = {
    pii_entities_config = [
      {
        action = "BLOCK"
        type   = "NAME"
      }
    ],
    regexes_config = [
      {
        action      = "BLOCK"
        description = "example regex"
        name        = "regex_example"
        pattern     = "^\\d{3}-\\d{2}-\\d{4}$"
      }
    ]
  }
}

variable "topic_policy_config" {
  description = "A map of key-value pairs representing the configuration for the topic policy."
  type = object({
    topics_config = optional(list(object({
      name       = string
      examples   = list(string)
      type       = string
      definition = string
    })))
  })
  default = {
    topics_config = [
      {
        name       = "investment_topic"
        examples   = ["Where should I invest my money ?"]
        type       = "DENY"
        definition = "Investment advice refers to inquiries, guidance, or recommendations regarding the management or allocation of funds or assets with the goal of generating returns ."
      }
    ]
  }
}

variable "word_policy_config" {
  description = "Configuration for word-based policies, including managed word lists and custom banned words."
  type = object({
    managed_word_lists_config = optional(object({
      type = string
    }))
    words_config = optional(object({
      text = string
    }))
  })
  default = {
    managed_word_lists_config = {
      type = "PROFANITY"
    }
    words_config = {
      text = "HATE"
    }
  }
}

variable "tags" {
  description = "Key-value pairs used to tag the guardrail resource for organization and identification."
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "BedrockProject"
  }
}
