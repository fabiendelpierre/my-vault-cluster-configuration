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