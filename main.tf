resource "google_service_account_iam_binding" "service_account_iam_bindings" {
  for_each = var.service_account_iam_bindings

  members            = each.value.members
  role               = each.value.role
  service_account_id = each.value.service_account_id

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

