## provider variables ##

variable "pm_api_url" {
  type        = string
  description = "This is the target Proxmox API endpoint."
}

variable "pm_api_token_id" {
  type        = string
  description = "This is an API token you have previously created for a specific user."
  sensitive   = true
}

variable "pm_api_token_secret" {
  type        = string
  description = "This uuid is only available when the token was initially created."
  sensitive   = true
}

variable "ciuser" {
  type        = string
  description = "Override the default cloud-init user"
}

variable "cipassword" {
  type        = string
  description = "Override the default cloud-init password"
}

variable "cisshkeys" {
  type        = string
  description = <<EOT
Newline delimited list of SSH public keys to add to authorized keys file for the
cloud-init user.
EOT
}

variable "domain" {
  description = "Domain to use"
  type        = string
}

variable "nameserver" {
  description = "DNS Server"
  type        = string
}
