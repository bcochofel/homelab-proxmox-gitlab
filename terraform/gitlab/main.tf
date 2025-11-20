provider "proxmox" {
  # Configuration options
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret

  #pm_tls_insecure = true
}

module "gitlab" {
  source = "../modules/create_server"

  vms = var.vms
}
