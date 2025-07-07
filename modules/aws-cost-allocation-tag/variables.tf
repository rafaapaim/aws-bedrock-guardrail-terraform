variable tag_key {
  type        = string
  default     = "Project"
  description = "The key for the cost allocation tag."
}

variable status {
  type        = string
  default     = "Active"
  description = "The status of the cost allocation tag. Valid values are 'Active' and 'Inactive'."
}
