output "hostname" { value = local.hostname }
output "ip" { value = proxmox_vm_qemu.vm.default_ipv4_address }
