#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*             Root Module - Variables                   *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#


variable "client_id" {
    description =   "Client ID (APP ID) of the application"
    type        =   string
}

variable "client_secret" {
    description =   "Client Secret (Password) of the application"
    type        =   string
}

variable "subscription_id" {
    description =   "Subscription ID"
    type        =   string
}

variable "tenant_id" {
    description =   "Tenant ID"
    type        =   string
}

variable "number_of_subnet" {
  type        = number
  default     = 2
  description = "This defines number of subnets"
  validation {
    condition     = var.number_of_subnet > 0 && var.number_of_subnet < 5
    error_message = "The number of subnet must be > 0 and < 5"
  }
}

variable "number_of_windows_vm" {
  type = number
  default = 1
  description = "This defines number of windows virtual machines"
}