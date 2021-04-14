locals {
  oidc_groups_map = jsondecode(var.oidc_group_mappings)
}