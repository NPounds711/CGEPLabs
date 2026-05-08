variable "project_name" {
  type        = string
  description = "Short project identifier. Becomes part of the vault bucket name."
  default     = "cgep-lab"
}

variable "lock_mode" {
  type        = string
  description = "GOVERNANCE for lab work (bypassable); COMPLIANCE for production evidence (permanent)."
  default     = "GOVERNANCE"

  validation {
    condition     = contains(["GOVERNANCE", "COMPLIANCE"], var.lock_mode)
    error_message = "lock_mode must be GOVERNANCE or COMPLIANCE."
  }
}

variable "retention_days" {
  type        = number
  description = "Default retention window applied to every uploaded object."
  default     = 1
}
