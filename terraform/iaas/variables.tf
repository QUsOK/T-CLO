variable "resource_group_name" {
  description = "Nom du Resource Group existant"
  type        = string
  default     = "rg-ncy_3"
}

variable "location" {
  description = "Région Azure"
  type        = string
  default     = "northeurope"
}

variable "admin_username" {
  description = "Nom d'utilisateur admin de la VM"
  type        = string
  default     = "azureuser"
}