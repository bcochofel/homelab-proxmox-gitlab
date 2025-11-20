## Create VMs ##

resource "random_pet" "server_name" {
  for_each = local.servers
}

resource "proxmox_vm_qemu" "vms" {
  for_each = local.servers

  name         = each.value.name != null ? each.value.name : random_pet.server_name[each.key].id
  target_node  = each.value.target_node
  vmid         = each.value.vmid
  desc         = each.value.desc
  onboot       = each.value.onboot
  boot         = each.value.boot
  agent        = each.value.agent
  clone        = each.value.clone
  full_clone   = each.value.full_clone
  memory       = each.value.memory
  sockets      = each.value.sockets
  cores        = each.value.cores
  scsihw       = each.value.scsihw
  pool         = each.value.pool
  tags         = each.value.tags
  os_type      = each.value.os_type
  searchdomain = each.value.searchdomain
  nameserver   = each.value.nameserver
  ipconfig0    = each.value.ipconfig0
  ciuser       = each.value.ciuser
  cipassword   = each.value.cipassword
  sshkeys      = each.value.sshkeys

  network {
    model  = each.value.network.model
    bridge = each.value.network.bridge
  }

  disks {
    ide {
      ide2 {
        cloudinit {
          storage = var.default_disk_storage
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size    = "60G"
          storage = var.default_disk_storage
          format  = var.default_disk_format
        }
      }
      #      scsi1 {
      #        disk {
      #          size    = each.value.disk.size
      #          storage = each.value.disk.storage
      #          format  = each.value.disk.format
      #        }
      #      }
    }
  }
}

# generate ansible inventory file
#resource "local_file" "ansible_inventory" {
#  content = templatefile("${path.root}/templates/inventory.tftpl", {
#    ansible_group = var.ansible_group
#    vms_ips = flatten([
#      for srv_key, srv in resource.proxmox_vm_qemu.vms : [
#        split("=", split("/", srv.ipconfig0)[0])[1]
#      ]
#    ])
#  })
#  filename        = var.ansible_inventory_file
#  file_permission = "0640"
#}
