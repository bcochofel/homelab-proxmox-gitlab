provider "proxmox" {
  # Configuration options
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret

  pm_tls_insecure = true
}

module "vm" {
  source = "../modules/vm"

  role        = "gitlab"
  pm_node     = "pve1"
  target_pool = ""
  pm_template = "ubuntu-24.04-template"

  ciuser     = var.ciuser
  cipassword = var.cipassword
  sshkeys    = var.cisshkeys

  cores     = 4
  memory    = 8192
  disk_size = "60G"

  seardomain = var.domain
  nameserver = var.nameserver

  ipconfig0 = "ip=${var.ip_cidr},gw=${var.gateway}"

  tags = "gitlab;ubuntu"

  inventory_path  = "../../ansible/inventories/gitlab.yml"
  group_vars_path = "../../ansible/group_vars/gitlab.yml"

  extra_vars = {
    gitlab_domain = "gitlab.${var.domain}"
    gitlab_email  = var.admin_email
  }
}
