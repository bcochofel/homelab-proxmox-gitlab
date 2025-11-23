variable "pm_node" {
  description = "The name of the PVE Node on which to place the VM."
  type        = string
}

variable "target_pool" {
  description = "The resource pool to which the VM will be added."
  type        = string
}

variable "pm_template" {
  type = string
}

variable "full_clone" {
  description = "Set to true to create a full clone, or false to create a linked clone."
  type        = bool
  default     = true
}

variable "role" {
  description = "What role this VM has (gitlab or gitlab-runner)"
  type        = string
}

variable "boot" {
  description = "The boot order for the VM."
  type        = string
  default     = "order=scsi0"
}

variable "onboot" {
  description = "Whether to have the VM startup after the PVE node starts."
  type        = bool
  default     = true
}

variable "agent" {
  description = "Set to 1 to enable the QEMU Guest Agent."
  type        = number
  default     = 1
}

variable "os_type" {
  description = "Which provisioning method to use, based on the OS type."
  type        = string
  default     = "cloud-init"

  validation {
    condition     = contains(["ubuntu", "centos", "cloud-init"], var.os_type)
    error_message = "Valid values for var: ubuntu, centos, cloud-init"
  }
}

variable "ciuser" {
  description = " 	Override the default cloud-init user for provisioning."
  type        = string
  default     = "ubuntu"
}

variable "cipassword" {
  description = "Override the default cloud-init user's password. Sensitive"
  type        = string
  sensitive   = true
  default     = "ubuntu"
}

variable "sshkeys" {
  description = <<EOT
Newline delimited list of SSH public keys to add to authorized keys file for
the cloud-init user.
EOT
  type        = string
}

variable "seardomain" {
  description = "Sets default DNS search domain suffix."
  type        = string
  default     = ""
}

variable "nameserver" {
  description = "Sets default DNS server for guest."
  type        = string
  default     = ""
}

variable "ipconfig0" {
  description = "The first IP address to assign to the guest"
  type        = string
  default     = "ip=dhcp"
}

variable "scsihw" {
  description = "The SCSI controller to emulate."
  type        = string
  default     = "virtio-scsi-pci"

  validation {
    condition = contains(
      ["lsi",
        "lsi53c810",
        "megasas",
        "pvscsi",
        "virtio-scsi-pci",
        "virtio-scsi-single"
    ], var.scsihw)
    error_message = <<EOT
Valid values for var:
  - lsi
  - lsi53c810
  - megasas
  - pvscsi
  - virtio-scsi-pci
  - virtio-scsi-single
EOT
  }
}

variable "memory" {
  description = "The amount of memory to allocate to the VM in Megabytes."
  type        = number
  default     = 2048
}

variable "sockets" {
  description = "The number of CPU sockets to allocate to the Qemu guest."
  type        = number
  default     = 1
}

variable "cores" {
  description = "The number of CPU cores to allocate to the Qemu guest."
  type        = number
  default     = 4
}

variable "tags" {
  description = "Tags of the VM. This is only meta information."
  type        = string
  default     = ""
}

variable "network_bridge" {
  description = "Bridge to which the network device should be attached."
  type        = string
  default     = "vmbr0"
}

variable "network_model" {
  description = "Required Network Card Model."
  type        = string
  default     = "e1000"
}

variable "disk_storage" {
  description = "Required The name of the storage pool on which to store the disk."
  type        = string
  default     = "local-lvm"
}

variable "disk_size" {
  description = "Required The size of the created disk, format must match the regex \\d+[GMK],"
  type        = string
  default     = "60G"
}

variable "inventory_path" {
  type = string
}

variable "group_vars_path" {
  type = string
}

variable "extra_vars" {
  description = "Dynamic vars such as domain, email, gitlab_url, runner token"
  type        = map(any)
  default     = {}
}

variable "create_registration_token" {
  type    = bool
  default = false
}

variable "registration_token_path" {
  type    = string
  default = null
}
