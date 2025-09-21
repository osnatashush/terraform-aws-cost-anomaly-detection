# terraform-aws-cost-anomaly-detector

This Terraform module provisions a AWS Cost Anomaly Detection.
AWS Cost Anomaly Detection is a monitoring feature that utilizes advanced machine learning techniques that identify anomalous and suspicious spend behaviors as early as possible. This helps you avoid unexpected and expensive surprises in your AWS bills.

## Installation

To use this module, you need to have Terraform installed. You can find installation instructions on the Terraform website.

## Usage

The module will create an AWS Cost anomaly Detection.
Use this module multiple times to create repositories with different configurations.

Include this repository as a module in your existing terraform code:

```python


################################################################################
# AWS Cost anomaly Detection
################################################################################

resource "aws_sns_topic" "sns_topic" {
  name         = "sns"
  display_name = "sns"
}

module "cost-anomaly-detector-example" {
  source              = "osnatashush/cost-anomaly-detection/aws"
  # version  = "x.x.x"

  sns_topic            = aws_sns_topic.sns_topic.arn
  raise_amount_percent  = var.raise_amount_percent
  raise_amount_absolute = var.raise_amount_absolute
  resource_tags = var.tags
}


```

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 0.13  |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 4.0.0 |

## Providers

| Name                                             | Version  |
| ------------------------------------------------ | -------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | >= 4.0.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                     | Type     |
| -------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_ce_anomaly_monitor.anomaly_monitor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ce_anomaly_monitor)                 | resource |
| [aws_ce_anomaly_subscription.realtime_subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ce_anomaly_subscription) | resource |

## Inputs

| Name                                                                                                | Description                                                                                                                                     | Type          | Default | Required |
| --------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_anomaly_monitor_arn"></a> [anomaly_monitor_arn](#input_anomaly_monitor_arn)          | The arn of the anomaly monitor, only if the create_anomaly_monitor is false                                                                     | `string`      | `""`    |    no    |
| <a name="input_create_anomaly_monitor"></a> [create_anomaly_monitor](#input_create_anomaly_monitor) | Boolian for create anomaly_monitor or use an exist one                                                                                          | `bool`        | `true`  |    no    |
| <a name="input_email"></a> [email](#input_email)                                                    | Email to notify                                                                                                                                 | `string`      | `""`    |    no    |
| <a name="input_raise_amount_absolute"></a> [raise_amount_absolute](#input_raise_amount_absolute)    | The Absolut increase in USD to trigger the detector. (ANOMALY_TOTAL_IMPACT_ABSOLUTE)                                                            | `string`      | n/a     |   yes    |
| <a name="input_raise_amount_percent"></a> [raise_amount_percent](#input_raise_amount_percent)       | An Expression object used to specify the anomalies that you want to generate alerts for. The precentage service cost increase than the expected | `string`      | n/a     |   yes    |
| <a name="input_resource_tags"></a> [resource_tags](#input_resource_tags)                            | Tags to set for all resources                                                                                                                   | `map(string)` | `{}`    |    no    |
| <a name="input_sns_topic"></a> [sns_topic](#input_sns_topic)                                        | SNS Topic to notify                                                                                                                             | `string`      | `""`    |    no    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->

## information

1. Time to create a cost-anomaly-detector is around 5 minutes.

## License

MIT
