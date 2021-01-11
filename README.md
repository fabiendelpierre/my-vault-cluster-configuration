# Terraform code repository

Manage the configuration of my Hashicorp Vault instance.

Note: this uses a self-hosted GitHub Actions runner living on the same VM as Vault itself. I wanted to use vanilla Terraform Cloud to manage Vault, however I have a limited IP allowlist on my Vault endpoint, and the problem with Terraform Cloud runners is they can come from any IP in the AWS cloud, which makes it difficult to manage an allowlist.

So instead of using TF Cloud conventionally, this repository is set up to use Terraform Cloud via the CLI-driven workflow, which runs locally on the Vault node. Also a good opportunity to demo GitHub Actions.