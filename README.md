# Azure Monitoring Script
### Overview
This Terraform script automates the setup of monitoring resources in Azure, including the creation of a special resource group for monitoring, an action group for sending alerts, Azure Advisor alerts, and a budget for monitoring consumption.


## Steps to Run the Script
1. Clone Repository: Clone this repository to your local machine.


2. Navigate to Directory: Navigate to the directory containing the script.
`cd <directory-path>`

3. Login to Azure: Use Azure CLI to login and authenticate with your Azure account.
`az login --use-device-code `

4. Set Subscription: Set the specific Azure subscription to use.
`az account set --subscription <subscription-name-or-id>`

5. Initialize Terraform: Initialize Terraform in the directory.
`terraform init`

6. Review Variables: Review the variables in the **variables.tf** file and provide appropriate values in the **terraform.tfvars file**.
7. Preview changes: create an execution plan, which allows you to preview the changes that Terraform plans to make to your infrastructure
terraform plan
8. Execute Script: Execute the Terraform script to create resources in Azure.
`terraform apply`

9. Destroy Resources: Permanently destroys the resources created in Azure.
`terraform destroy`
P.S: YOU CAN ONLY USE THIS IF YOU'VE NOT MANUALLY EDITED THE SCRIPT AFTER RUNNING `TERRAFORM APPLY`


### Script Details
The script performs the following steps:

1. **Create Special Resource Group for Monitoring**: Creates a resource group dedicated to monitoring resources.

2. **Create Action Group**: Creates an action group named "Send Azure Alerts" for sending alerts.

3. **Create Azure Advisor Alerts**: Creates Azure Advisor alerts that trigger the "Send Azure Alerts" action group.

4. **Create Azure Budget**: Sets up a budget for monitoring consumption.
