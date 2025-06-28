resource "aws_bedrock_guardrail" "aws-guardrail" {
  name                      = var.name
  blocked_input_messaging   = var.blocked_input_messaging
  blocked_outputs_messaging = var.blocked_outputs_messaging
  description               = var.description
  kms_key_arn               = var.kms_key_arn
  tags                      = var.tags

  content_policy_config {
    dynamic "filters_config" {
      for_each = var.filters_config
      content {
        type            = filters_config.value.type
        input_strength  = filters_config.value.input_strength
        output_strength = filters_config.value.output_strength
      }
    }
  }

  dynamic "sensitive_information_policy_config" {
    for_each = var.sensitive_information_policy_config == null ? [] : [var.sensitive_information_policy_config]
    content {
      dynamic "pii_entities_config" {
        for_each = sensitive_information_policy_config.value.pii_entities_config != null ? sensitive_information_policy_config.value.pii_entities_config : []
        content {
          action = pii_entities_config.value.action
          type   = pii_entities_config.value.type
        }
      }
      dynamic "regexes_config" {
        for_each = sensitive_information_policy_config.value.regexes_config != null ? sensitive_information_policy_config.value.regexes_config : []
        content {
          action      = regexes_config.value.action
          description = regexes_config.value.description
          name        = regexes_config.value.name
          pattern     = regexes_config.value.pattern
        }
      }
    }
  }

  dynamic "topic_policy_config" {
    for_each = var.topic_policy_config == null ? [] : [var.topic_policy_config]
    content {
      dynamic "topics_config" {
        for_each = topic_policy_config.value.topics_config != null ? topic_policy_config.value.topics_config : []
        content {
          name       = topics_config.value.name
          type       = topics_config.value.type
          examples   = topics_config.value.examples
          definition = topics_config.value.definition
        }
      }
    }
  }

  dynamic "word_policy_config" {
    for_each = var.word_policy_config != null ? [var.word_policy_config] : []
    content {
      dynamic "managed_word_lists_config" {
        for_each = word_policy_config.value.managed_word_lists_config != null ? [word_policy_config.value.managed_word_lists_config] : []
        content {
          type = managed_word_lists_config.value.type
        }
      }
      dynamic "words_config" {
        for_each = word_policy_config.value.words_config != null ? [word_policy_config.value.words_config] : []
        content {
          text = words_config.value.text
        }
      }
    }
  }
}
