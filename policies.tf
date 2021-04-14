data "vault_policy_document" "vault_admin" {
  rule {
    path         = "sys/leases/*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    description  = "Allow managing leases"
  }
  rule {
    path         = "auth/*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    description  = "Manage auth methods broadly across Vault"
  }
  rule {
    path         = "sys/auth/*"
    capabilities = ["create", "update", "delete", "sudo"]
    description  = "Create, update, and delete auth methods"
  }
  rule {
    path         = "sys/auth"
    capabilities = ["read"]
    description  = "List auth methods"
  }
  rule {
    path         = "sys/policies/acl"
    capabilities = ["read","list"]
    description  = "List existing policies"
  }
  rule {
    path         = "sys/policies/acl/*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    description  = "Create and manage ACL policies"
  }
  rule {
    path         = "secret/*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    description  = "List, create, update, and delete key/value secrets"
  }
  rule {
    path         = "sys/mounts/*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    description  = "Manage secret engines"
  }
  rule {
    path         = "sys/mounts"
    capabilities = ["read"]
    description  = "List existing secret engines"
  }
  rule {
    path         = "sys/health"
    capabilities = ["read", "sudo"]
    description  = "Read health checks"
  }
}

resource "vault_policy" "vault_admin" {
  name   = "vault-admin"
  policy = data.vault_policy_document.vault_admin.hcl
}