variable "infra_name" {
    type        = string
    default     = "experiment"
    description = "name of project"
}

variable "infra_type" {
    type        = string
    default     = "web"
    description = "environment of development"
}

variable "api_token" {
    type        = string
    sensitive  = true
}
