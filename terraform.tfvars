# Terraform State Name
# stateName = "**"

# Resource Group variable
resource_group = "**"

# Resource Location 
location = "westeurope"

# Resource Action Group
action_group = "send Azure Alerts"

# Email Notification  Receiver
monitoring_receiver_address = "**"

# Budget amount and time 
amount     = "150"
time_grain = "Monthly"
start_date = "2024-04-01T00:00:00Z" #"01/01/2024"
end_date   = "2024-12-31T11:59:59Z" #"12/31/2024"
#threshold  = "<Input threshold for notification>"
