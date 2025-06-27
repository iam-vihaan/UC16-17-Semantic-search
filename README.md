## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.99.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.99.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_db_secret"></a> [db\_secret](#module\_db\_secret) | ./modules/secrets_manager | n/a |
| <a name="module_lambda_iam_role"></a> [lambda\_iam\_role](#module\_lambda\_iam\_role) | ./modules/iam_role | n/a |
| <a name="module_lambda_ingest"></a> [lambda\_ingest](#module\_lambda\_ingest) | ./modules/lambda | n/a |
| <a name="module_lambda_query"></a> [lambda\_query](#module\_lambda\_query) | ./modules/lambda | n/a |
| <a name="module_lambda_search"></a> [lambda\_search](#module\_lambda\_search) | ./modules/lambda | n/a |
| <a name="module_lambda_sg"></a> [lambda\_sg](#module\_lambda\_sg) | ./modules/security_group | n/a |
| <a name="module_raw_s3_bucket"></a> [raw\_s3\_bucket](#module\_raw\_s3\_bucket) | ./modules/s3 | n/a |
| <a name="module_rds_postgres"></a> [rds\_postgres](#module\_rds\_postgres) | ./modules/rds_postgresql | n/a |
| <a name="module_rds_sg"></a> [rds\_sg](#module\_rds\_sg) | ./modules/security_group | n/a |
| <a name="module_search_api"></a> [search\_api](#module\_search\_api) | ./modules/api_gateway | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_lambda_permission.allow_s3_to_invoke_lambda](https://registry.terraform.io/providers/hashicorp/aws/5.99.1/docs/resources/lambda_permission) | resource |
| [aws_s3_bucket_notification.lambda_trigger](https://registry.terraform.io/providers/hashicorp/aws/5.99.1/docs/resources/s3_bucket_notification) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_name"></a> [api\_name](#input\_api\_name) | n/a | `string` | n/a | yes |
| <a name="input_api_stage_name"></a> [api\_stage\_name](#input\_api\_stage\_name) | n/a | `string` | `"$default"` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones | `list(string)` | n/a | yes |
| <a name="input_create_nat_gateway"></a> [create\_nat\_gateway](#input\_create\_nat\_gateway) | Whether to create a NAT Gateway | `bool` | n/a | yes |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | n/a | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | n/a | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | n/a | `string` | n/a | yes |
| <a name="input_db_secret_name"></a> [db\_secret\_name](#input\_db\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | n/a | `string` | n/a | yes |
| <a name="input_ingest_lambda_key"></a> [ingest\_lambda\_key](#input\_ingest\_lambda\_key) | n/a | `string` | n/a | yes |
| <a name="input_ingest_lambda_name"></a> [ingest\_lambda\_name](#input\_ingest\_lambda\_name) | n/a | `string` | n/a | yes |
| <a name="input_lambda_code_bucket"></a> [lambda\_code\_bucket](#input\_lambda\_code\_bucket) | n/a | `string` | n/a | yes |
| <a name="input_lambda_egress_rules"></a> [lambda\_egress\_rules](#input\_lambda\_egress\_rules) | Egress rules for Lambda SG | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_lambda_policy_arns"></a> [lambda\_policy\_arns](#input\_lambda\_policy\_arns) | n/a | `list(string)` | n/a | yes |
| <a name="input_lambda_role_name"></a> [lambda\_role\_name](#input\_lambda\_role\_name) | n/a | `string` | n/a | yes |
| <a name="input_lambda_runtime"></a> [lambda\_runtime](#input\_lambda\_runtime) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | VPC name | `string` | n/a | yes |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | CIDR blocks for private subnets | `list(string)` | n/a | yes |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | CIDR blocks for public subnets | `list(string)` | n/a | yes |
| <a name="input_query_lambda_key"></a> [query\_lambda\_key](#input\_query\_lambda\_key) | n/a | `string` | n/a | yes |
| <a name="input_query_lambda_name"></a> [query\_lambda\_name](#input\_query\_lambda\_name) | n/a | `string` | n/a | yes |
| <a name="input_qurey_layers"></a> [qurey\_layers](#input\_qurey\_layers) | List of Lambda layer ARNs for the query lambda. | `list(string)` | `[]` | no |
| <a name="input_raw_bucket_name"></a> [raw\_bucket\_name](#input\_raw\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_rds_egress_rules"></a> [rds\_egress\_rules](#input\_rds\_egress\_rules) | Egress rules for RDS SG | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_rds_ingress_rules"></a> [rds\_ingress\_rules](#input\_rds\_ingress\_rules) | Ingress rules for RDS SG | <pre>list(object({<br>    from_port       = number<br>    to_port         = number<br>    protocol        = string<br>    security_groups = optional(list(string))<br>    cidr_blocks     = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_search_lambda_key"></a> [search\_lambda\_key](#input\_search\_lambda\_key) | n/a | `string` | n/a | yes |
| <a name="input_search_lambda_name"></a> [search\_lambda\_name](#input\_search\_lambda\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_endpoint"></a> [db\_endpoint](#output\_db\_endpoint) | n/a |
| <a name="output_db_secret_arn"></a> [db\_secret\_arn](#output\_db\_secret\_arn) | n/a |
| <a name="output_lambda_ingest_name"></a> [lambda\_ingest\_name](#output\_lambda\_ingest\_name) | n/a |
| <a name="output_lambda_search_url"></a> [lambda\_search\_url](#output\_lambda\_search\_url) | n/a |
| <a name="output_raw_bucket_name"></a> [raw\_bucket\_name](#output\_raw\_bucket\_name) | n/a |
