# Terraform Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0, < 2.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.5.2 |
| <a name="requirement_pihole"></a> [pihole](#requirement\_pihole) | 2.0.0-beta.1 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 3.0.2-rc05 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vm"></a> [vm](#module\_vm) | ../modules/vm | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | Admin email | `string` | n/a | yes |
| <a name="input_cipassword"></a> [cipassword](#input\_cipassword) | Override the default cloud-init password | `string` | n/a | yes |
| <a name="input_cisshkeys"></a> [cisshkeys](#input\_cisshkeys) | Newline delimited list of SSH public keys to add to authorized keys file for the<br/>cloud-init user. | `string` | n/a | yes |
| <a name="input_ciuser"></a> [ciuser](#input\_ciuser) | Override the default cloud-init user | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain to use | `string` | n/a | yes |
| <a name="input_gateway"></a> [gateway](#input\_gateway) | Network Gateway | `string` | n/a | yes |
| <a name="input_ip_cidr"></a> [ip\_cidr](#input\_ip\_cidr) | IP CIDR | `string` | n/a | yes |
| <a name="input_nameserver"></a> [nameserver](#input\_nameserver) | DNS Server | `string` | n/a | yes |
| <a name="input_pm_api_token_id"></a> [pm\_api\_token\_id](#input\_pm\_api\_token\_id) | This is an API token you have previously created for a specific user. | `string` | n/a | yes |
| <a name="input_pm_api_token_secret"></a> [pm\_api\_token\_secret](#input\_pm\_api\_token\_secret) | This uuid is only available when the token was initially created. | `string` | n/a | yes |
| <a name="input_pm_api_url"></a> [pm\_api\_url](#input\_pm\_api\_url) | This is the target Proxmox API endpoint. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
