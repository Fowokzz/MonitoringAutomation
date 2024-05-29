terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.1.0"
    }
  }
  #the Terraform State needs to be manage in the same subscription for all the deployments
  #PLEASE DONT CHANGE THIS CODE
  backend "azurerm" {
    resource_group_name  = "**"
    storage_account_name = "**"
    container_name       = "**"
    key                  = "**"
  }
  required_version = ">= 1.0.0"
}

# Terraform Remote State Azure https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli

provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.  
  #prevent_deletion_if_contains_resources = false 
  features {}

  #subscription_id = data.azurerm_subscription.current.id

}
data "azurerm_subscription" "current" {}