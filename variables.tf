#variable "azure_subscription_id" {
#  type        = string
#  description = "Azure subscription id under which resources will be provisioned"
#  default     = <subscription ID>
#}

#variable "azure_tenant_id" {
#  type = string
#  default = <Tenant ID>
#}

locals {
  #please put here the name of the name of the state
  stateName = "automation"
}

variable "resource_group" {
  type        = string
  description = "Resource group where monitoring alerts and Azure Budgets will be created"
  default     = "azr-monitoring-tr001"
}

variable "location" {
  type    = string
  default = "Global"
}

variable "action_group" {
  type        = string
  description = "this is the Alerts Action group"
  default     = "Send Azure Alerts"
}

variable "email_receiver_name" {
  type        = string
  description = "Email details of monitoring reader"
  default     = "Monitoring Reader"
}

variable "monitoring_receiver_address" {
  type        = string
  description = "Email address of monitoring reader"
  default     = "<Email Address>"
}

variable "monthly_budget_name" {
  type        = string
  description = "Azure monthly budget"
  default     = "Monthly_Budget"
}

variable "amount" {
  description = "The desired monthly recurring cost"
  type        = number
  default     = 000
}

variable "time_grain" {
  description = "The time grain for the consumption budget"
  default     = "2022-07-01T00:00:00Z"
}

variable "start_date" {
  description = "The start date of the consumption budget"
  type        = string
}

variable "end_date" {
  description = "The end date of the consumption budget"
  type        = string
}

# variable "threshold" {
#   description = "The threshold for notifications"
#   type        = number
# }

# variable "contact_email_address" {
#   description = "Email address for receiving monitoring notifications"
#   type        = string
# }

# variable "contact_group_name" {
#   description = "Name of the contact group for notifications"
#   type        = string
# }