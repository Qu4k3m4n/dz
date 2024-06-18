## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.121.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_analytics"></a> [analytics](#module\_analytics) | git::https://github.com/udjin10/yandex_compute_instance.git | main |
| <a name="module_marketing"></a> [marketing](#module\_marketing) | git::https://github.com/udjin10/yandex_compute_instance.git | main |
| <a name="module_vpc_dev"></a> [vpc\_dev](#module\_vpc\_dev) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [template_file.cloudinit](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [yandex_vpc_network.develop_network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/vpc_network) | data source |
| [yandex_vpc_subnet.develop_subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/vpc_subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | n/a | `list` | <pre>[<br>  "ru-central1-a"<br>]</pre> | no |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | n/a | `string` | `"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHMx6AhDUsS7LtY5mxNxMHUwEwWodwUIz7jumDOTrq6p quakeman@WIN-HKA0F9TV73I"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_id_from_module"></a> [subnet\_id\_from\_module](#output\_subnet\_id\_from\_module) | n/a |
| <a name="output_vpc_name_from_module"></a> [vpc\_name\_from\_module](#output\_vpc\_name\_from\_module) | n/a |
