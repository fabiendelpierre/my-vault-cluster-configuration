variable "oidc_discovery_url" {
  type = string
}

variable "oidc_client_id" {
  type = string
}

variable "oidc_client_secret" {
  type = string
}

variable "oidc_allowed_redirect_uris" {
  type = string
}

variable "oidc_group_mappings" {
  type = map
}