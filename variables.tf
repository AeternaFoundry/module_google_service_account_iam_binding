variable "service_account_iam_bindings" {
  description = <<EOT
Map of service_account_iam_bindings, attributes below
Required:
    - members
    - role
    - service_account_id
Optional:
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    members            = set(string)
    role               = string
    service_account_id = string
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

