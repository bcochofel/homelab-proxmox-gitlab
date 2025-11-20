# Terraform Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0, < 2.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.5.2 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 3.0.1-rc4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gitlab-runner"></a> [gitlab-runner](#module\_gitlab-runner) | ../modules/create_server | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cipassword"></a> [cipassword](#input\_cipassword) | Override the default cloud-init password | `string` | n/a | yes |
| <a name="input_cisshkeys"></a> [cisshkeys](#input\_cisshkeys) | Newline delimited list of SSH public keys to add to authorized keys file for the<br/>cloud-init user. | `string` | n/a | yes |
| <a name="input_ciuser"></a> [ciuser](#input\_ciuser) | Override the default cloud-init user | `string` | n/a | yes |
| <a name="input_pm_api_token_id"></a> [pm\_api\_token\_id](#input\_pm\_api\_token\_id) | This is an API token you have previously created for a specific user. | `string` | n/a | yes |
| <a name="input_pm_api_token_secret"></a> [pm\_api\_token\_secret](#input\_pm\_api\_token\_secret) | This uuid is only available when the token was initially created. | `string` | n/a | yes |
| <a name="input_pm_api_url"></a> [pm\_api\_url](#input\_pm\_api\_url) | This is the target Proxmox API endpoint. | `string` | n/a | yes |
| <a name="input_vms"></a> [vms](#input\_vms) | n/a | <pre>map(object({<br/>    name         = optional(string)<br/>    target_node  = optional(string)<br/>    vmid         = optional(number)<br/>    desc         = optional(string)<br/>    onboot       = optional(bool)<br/>    boot         = optional(string)<br/>    agent        = optional(number)<br/>    clone        = optional(string)<br/>    full_clone   = optional(bool)<br/>    memory       = optional(number)<br/>    sockets      = optional(number)<br/>    cores        = optional(number)<br/>    scsihw       = optional(string)<br/>    pool         = optional(string)<br/>    tags         = optional(string)<br/>    os_type      = optional(string)<br/>    searchdomain = optional(string)<br/>    nameserver   = optional(string)<br/>    ipconfig0    = optional(string)<br/>    network = optional(object({<br/>      model  = optional(string)<br/>      bridge = optional(string)<br/>    }))<br/>    disk = optional(object({<br/>      size    = optional(string)<br/>      storage = optional(string)<br/>      format  = optional(string)<br/>    }))<br/>  }))</pre> | <pre>{<br/>  "vm1": {<br/>    "ipconfig0": "ip=192.168.68.35/22,gw=192.168.68.1"<br/>  }<br/>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
