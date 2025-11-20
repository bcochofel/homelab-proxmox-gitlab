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

variable "vms" {
  type = map(object({
    name         = optional(string)
    target_node  = optional(string)
    vmid         = optional(number)
    desc         = optional(string)
    onboot       = optional(bool)
    boot         = optional(string)
    agent        = optional(number)
    clone        = optional(string)
    full_clone   = optional(bool)
    memory       = optional(number)
    sockets      = optional(number)
    cores        = optional(number)
    scsihw       = optional(string)
    pool         = optional(string)
    tags         = optional(string)
    os_type      = optional(string)
    searchdomain = optional(string)
    nameserver   = optional(string)
    ipconfig0    = optional(string)
    network = optional(object({
      model  = optional(string)
      bridge = optional(string)
    }))
    disk = optional(object({
      size    = optional(string)
      storage = optional(string)
      format  = optional(string)
    }))
  }))
  default = {
    vm1 = {
      ipconfig0 = "ip=192.168.68.30/22,gw=192.168.68.1"
    }
  }
}
