provider "proxmox" {
  # Configuration options
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret

  #pm_tls_insecure = true
}

module "gitlab-runner" {
  source = "../modules/create_server"

  vms = var.vms

  default_ciuser     = var.ciuser
  default_cipassword = var.cipassword
  default_cisshkeys  = var.cisshkeys
}
