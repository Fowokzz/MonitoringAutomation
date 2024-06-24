
#To import subscription details 
# data "azurerm_subscription" "**" {
#   name = "**"
# }
# Step 1: Create special resource group for monitoring
resource "azurerm_resource_group" "monitoring_rg" {
  name     = var.resource_group
  location = var.location
}

# Step 2: Create Action Group named "Send Azure Alerts"
resource "azurerm_monitor_action_group" "send_azure_alerts" {
  name                = var.action_group
  resource_group_name = var.resource_group
  short_name          = "**"

  email_receiver {
    name          = var.email_receiver_name
    email_address = var.monitoring_receiver_address
  }
}

# Step 3: Create Azure Advisor Alerts triggering "Send Azure Alerts" action group
resource "azurerm_monitor_activity_log_alert" "advisor_alert" {
  name                = "Azure Advisor Alert"
  resource_group_name = var.resource_group
  scopes              = [azurerm_resource_group.monitoring_rg.id]
  #Configuration of category and impact level
  criteria {
    category = "Recommendation"
    #impact_level         = 
  }
  #To trigger 'Send Azure Alerts' action group to send alerts to the users with Monitoring Reader assigned roles any time there is a new recommendation. 

  action {
    action_group_id = azurerm_monitor_action_group.send_azure_alerts.id
  }

  depends_on = [azurerm_monitor_action_group.send_azure_alerts]
}

# Step 4: Create Azure Budget
resource "azurerm_consumption_budget_subscription" "budget" {
  name                = var.monthly_budget_name
  subscription_id     = data.azurerm_subscription.current.id

  amount              = var.amount
  time_grain          = var.time_grain
  time_period {
    start_date = var.start_date #"2022-06-01T00:00:00Z"
    end_date   = var.end_date #"2022-07-01T00:00:00Z"
  }

  #filter {
  #  dimension {
  #    name = "ResourceGroupName"
  #    values = [
  #      azurerm_resource_group.monitoring_rg.name,
  #    ]
  #  }
  #}

  notification {
    threshold = 80
    operator  = "EqualTo"
    threshold_type = "Actual"
    contact_emails = [
      "**"
      ]
       
  }
  
}