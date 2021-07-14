terraform {
  required_version = "~> 1.0"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 2.21"
    }
  }

  # backend "remote" {
  #   organization = "fabiend"

  #   workspaces {
  #     name = "my-vault-cluster-configuration"
  #   }
  # }
}

provider "vault" {}