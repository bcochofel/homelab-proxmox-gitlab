output "vms" {
  value = {
    for k, v in resource.proxmox_vm_qemu.vms :
    k => {
      name = v.name
      ip   = split("=", split("/", v.ipconfig0)[0])[1]
    }
  }
}

output "vms_ips" {
  value = flatten([
    for srv_key, srv in resource.proxmox_vm_qemu.vms : [
      split("=", split("/", srv.ipconfig0)[0])[1]
    ]
  ])
}
