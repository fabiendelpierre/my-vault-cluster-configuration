# This allows humans to log in to Vault with Azure AD credentials
resource "vault_jwt_auth_backend" "vault_ad_groups" {
  description = "Azure AD OIDC through Azure AD groups"
  path        = "oidc"
  type        = "oidc"

  default_role = "oidc"

  oidc_discovery_url = var.oidc_discovery_url
  oidc_client_id     = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret
}

resource "vault_jwt_auth_backend_role" "vault_ad_groups" {
  backend        = vault_jwt_auth_backend.vault_ad_groups.path
  role_name      = "oidc"
  token_policies = ["default"]

  user_claim = "email"
  role_type  = "oidc"

  allowed_redirect_uris = split(",", var.oidc_allowed_redirect_uris)

  groups_claim = "groups"
  oidc_scopes  = ["https://graph.microsoft.com/.default", "profile", "email"]

  verbose_oidc_logging = true
}

# Create a Vault group for each provided Azure AD group
resource "vault_identity_group" "oidc_groups" {
  for_each = local.oidc_groups_map

  name     = each.key
  type     = "external"
  policies = each.value.vault_policies
}

# Map the Vault groups' canonical IDs to the Azure AD groups' GUIDs
resource "vault_identity_group_alias" "oidc_group_aliases" {
  for_each = local.oidc_groups_map

  name           = each.value.aad_group_id
  mount_accessor = vault_jwt_auth_backend.vault_ad_groups.accessor
  canonical_id   = vault_identity_group.groups[each.key].id
}
