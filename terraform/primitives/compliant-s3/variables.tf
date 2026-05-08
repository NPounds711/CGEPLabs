variable "project_name" {
  description = "Short project identifier. Becomes part of bucket names and the Project tag."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "project_name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  description = "Deployment environment. Drives the Environment tag and downstream policy decisions."
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "bucket_suffix" {
  description = "Optional suffix to force a specific bucket name. Defaults to a random_id."
  type        = string
  default     = ""
}
