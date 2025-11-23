resource "random_pet" "hostname" {
  length = 2
}

locals {
  hostname = "${var.role}-${random_pet.hostname.id}"
}

resource "proxmox_vm_qemu" "vm" {
  target_node = var.pm_node
  pool        = var.target_pool

  name       = local.hostname
  clone      = var.pm_template
  full_clone = var.full_clone

  boot   = var.boot
  onboot = var.onboot
  agent  = var.agent

  os_type      = var.os_type
  ciuser       = var.ciuser
  cipassword   = var.cipassword
  sshkeys      = var.sshkeys
  searchdomain = var.seardomain
  nameserver   = var.nameserver
  ipconfig0    = var.ipconfig0

  scsihw = var.scsihw

  memory = var.memory

  cpu {
    sockets = var.sockets
    cores   = var.cores
  }

  network {
    id     = 0
    bridge = var.network_bridge
    model  = var.network_model
  }

  disks {
    ide {
      ide2 {
        cloudinit {
          storage = var.disk_storage
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size    = var.disk_size
          storage = var.disk_storage
        }
      }
    }
  }

  tags = var.tags
}

# Write inventory file
resource "local_file" "inventory" {
  filename = var.inventory_path

  content = templatefile("${path.module}/templates/inventory.yml.tmpl", {
    hostname = local.hostname
    ip       = proxmox_vm_qemu.vm.default_ipv4_address
    role     = var.role
  })
}

# Write group_vars
resource "local_file" "group_vars" {
  filename = var.group_vars_path

  content = templatefile("${path.module}/templates/group_vars.yml.tmpl", {
    extra = var.extra_vars
  })
}

# Optional GitLab Runner registration token
resource "local_file" "runner_token" {
  count    = var.create_registration_token ? 1 : 0
  filename = var.registration_token_path
  content = templatefile("${path.module}/templates/registration_token.tmpl", {
    token = var.extra_vars["registration_token"]
  })
}
