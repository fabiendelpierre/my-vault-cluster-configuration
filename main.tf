resource "vault_auth_backend" "userpass" {
  type = "userpass"

  tune {
    default_lease_ttl  = "600s"
    max_lease_ttl      = "3600s"
    listing_visibility = "unauth"
  }
}

resource "vault_auth_backend" "userpass2" {
  type = "userpass"
  path = "userpass2"

  tune {
    default_lease_ttl  = "600s"
    max_lease_ttl      = "3600s"
    listing_visibility = "unauth"
  }
}