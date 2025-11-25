provider "proxmox" {
  # Configuration options
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret

  pm_tls_insecure = true
}

module "vm" {
  source = "../modules/vm"

  role        = "gitlab_runner"
  pm_node     = "pve1"
  target_pool = ""
  pm_template = "ubuntu-24.04-template"

  ciuser     = var.ciuser
  cipassword = var.cipassword
  sshkeys    = var.cisshkeys

  cores     = 2
  memory    = 4096
  disk_size = "60G"

  seardomain = var.domain
  nameserver = var.nameserver

  tags = "gitlab-runner;ubuntu"

  inventory_path  = "../../ansible/inventories/generated/gitlab_runner.yml"
  group_vars_path = "../../ansible/inventories/generated/group_vars/gitlab_runner/vars.yml"

  create_registration_token = true
  registration_token_path   = "../../ansible/inventories/generated/group_vars/gitlab_runner/runner-token.yml"

  extra_vars = {
    gitlab_url         = "https://gitlab.${var.domain}"
    registration_token = var.registration_token
  }
}
