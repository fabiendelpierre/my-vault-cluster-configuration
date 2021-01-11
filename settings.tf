terraform {
  required_version = "~> 0.14"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 2.17"
    }
  }

  backend "remote" {
    organization = "fabiend"

    workspaces {
      name = "my-vault-cluster-configuration"
    }
  }
}

provider "vault" {}