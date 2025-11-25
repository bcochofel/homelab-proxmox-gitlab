# Terraform Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0, < 2.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.5.2 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 3.0.2-rc05 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.2 |
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 3.0.2-rc05 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.group_vars](https://registry.terraform.io/providers/hashicorp/local/2.5.2/docs/resources/file) | resource |
| [local_file.inventory](https://registry.terraform.io/providers/hashicorp/local/2.5.2/docs/resources/file) | resource |
| [local_file.runner_token](https://registry.terraform.io/providers/hashicorp/local/2.5.2/docs/resources/file) | resource |
| [proxmox_vm_qemu.vm](https://registry.terraform.io/providers/Telmate/proxmox/3.0.2-rc05/docs/resources/vm_qemu) | resource |
| [random_pet.hostname](https://registry.terraform.io/providers/hashicorp/random/3.6.3/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent"></a> [agent](#input\_agent) | Set to 1 to enable the QEMU Guest Agent. | `number` | `1` | no |
| <a name="input_boot"></a> [boot](#input\_boot) | The boot order for the VM. | `string` | `"order=scsi0"` | no |
| <a name="input_cipassword"></a> [cipassword](#input\_cipassword) | Override the default cloud-init user's password. Sensitive | `string` | `"ubuntu"` | no |
| <a name="input_ciuser"></a> [ciuser](#input\_ciuser) | Override the default cloud-init user for provisioning. | `string` | `"ubuntu"` | no |
| <a name="input_cores"></a> [cores](#input\_cores) | The number of CPU cores to allocate to the Qemu guest. | `number` | `4` | no |
| <a name="input_create_registration_token"></a> [create\_registration\_token](#input\_create\_registration\_token) | n/a | `bool` | `false` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Required The size of the created disk, format must match the regex \d+[GMK], | `string` | `"60G"` | no |
| <a name="input_disk_storage"></a> [disk\_storage](#input\_disk\_storage) | Required The name of the storage pool on which to store the disk. | `string` | `"local-lvm"` | no |
| <a name="input_extra_vars"></a> [extra\_vars](#input\_extra\_vars) | Dynamic vars such as domain, email, gitlab\_url, runner token | `map(any)` | `{}` | no |
| <a name="input_full_clone"></a> [full\_clone](#input\_full\_clone) | Set to true to create a full clone, or false to create a linked clone. | `bool` | `true` | no |
| <a name="input_group_vars_path"></a> [group\_vars\_path](#input\_group\_vars\_path) | n/a | `string` | n/a | yes |
| <a name="input_inventory_path"></a> [inventory\_path](#input\_inventory\_path) | n/a | `string` | n/a | yes |
| <a name="input_ipconfig0"></a> [ipconfig0](#input\_ipconfig0) | The first IP address to assign to the guest | `string` | `"ip=dhcp"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of memory to allocate to the VM in Megabytes. | `number` | `2048` | no |
| <a name="input_nameserver"></a> [nameserver](#input\_nameserver) | Sets default DNS server for guest. | `string` | `""` | no |
| <a name="input_network_bridge"></a> [network\_bridge](#input\_network\_bridge) | Bridge to which the network device should be attached. | `string` | `"vmbr0"` | no |
| <a name="input_network_model"></a> [network\_model](#input\_network\_model) | Required Network Card Model. | `string` | `"e1000"` | no |
| <a name="input_onboot"></a> [onboot](#input\_onboot) | Whether to have the VM startup after the PVE node starts. | `bool` | `true` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Which provisioning method to use, based on the OS type. | `string` | `"cloud-init"` | no |
| <a name="input_pm_node"></a> [pm\_node](#input\_pm\_node) | The name of the PVE Node on which to place the VM. | `string` | n/a | yes |
| <a name="input_pm_template"></a> [pm\_template](#input\_pm\_template) | n/a | `string` | n/a | yes |
| <a name="input_registration_token_path"></a> [registration\_token\_path](#input\_registration\_token\_path) | n/a | `string` | `null` | no |
| <a name="input_role"></a> [role](#input\_role) | What role this VM has (gitlab or gitlab\_runner) | `string` | n/a | yes |
| <a name="input_scsihw"></a> [scsihw](#input\_scsihw) | The SCSI controller to emulate. | `string` | `"virtio-scsi-pci"` | no |
| <a name="input_seardomain"></a> [seardomain](#input\_seardomain) | Sets default DNS search domain suffix. | `string` | `""` | no |
| <a name="input_sockets"></a> [sockets](#input\_sockets) | The number of CPU sockets to allocate to the Qemu guest. | `number` | `1` | no |
| <a name="input_sshkeys"></a> [sshkeys](#input\_sshkeys) | Newline delimited list of SSH public keys to add to authorized keys file for<br/>the cloud-init user. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags of the VM. This is only meta information. | `string` | `""` | no |
| <a name="input_target_pool"></a> [target\_pool](#input\_target\_pool) | The resource pool to which the VM will be added. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hostname"></a> [hostname](#output\_hostname) | n/a |
| <a name="output_ip"></a> [ip](#output\_ip) | n/a |
<!-- END_TF_DOCS -->
