variable "credentials" {}

variable "project_id" {
  description = "project id"
  type        = string
}

variable "dbname"{
    description = "database name"
    type = string
    default = "gcpautodatabase"
}

variable "username"{
    description = "username"
    type = string
    default = "cloudsqluser1"

}
variable "password" {
  description = "password"
  type = string
  default = "password123@"
}

variable "instance_name" {
  description = "instance name."
  type = string
  default     = "gcpautoinstance"
}

variable "database_version" {
  description = "db version"
  default     = "POSTGRES_12"
}

variable "region" {
  description = "region"
  default     = "us-central1"
}

variable "tier" {
  description = "tier"
  default     = "db-f1-micro"
}