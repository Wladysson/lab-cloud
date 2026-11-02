locals {
  common_tags = {
    Project     = var.project_name #define tag para identificaçao e organizaçao do recurso
    Environment = "lab"
    ManagedBy   = "Terraform"
  }
}