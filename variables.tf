variable "subscribers" {
  type = list(object({
    type    = string # "SNS" or "EMAIL"
    address = string # SNS ARN or email address
  }))
  description = "List of subscribers to notify when a new anomaly is detected"
  default     = []
}
variable "raise_amount_percent" {
  type        = string
  description = "An Expression object used to specify the anomalies that you want to generate alerts for. The precentage service cost increase than the expected"
}

variable "raise_amount_absolute" {
  type        = string
  description = "The Absolut increase in USD to trigger the detector. (ANOMALY_TOTAL_IMPACT_ABSOLUTE)"
}
variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {}
}
variable "create_anomaly_monitor" {
  type = bool
  default = true
  description = "Boolian for create anomaly_monitor or use an exist one"
}
variable "anomaly_monitor_arn" {
  type = string
  default = ""
  description = "The arn of the anomaly monitor, only if the create_anomaly_monitor is false"
}
