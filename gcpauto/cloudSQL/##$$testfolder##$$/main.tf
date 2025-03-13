terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.10.0"
    }
  }
}

provider "google" {
  project = var.project_id
  credentials = var.credentials
  region  = var.region

}

resource "google_sql_database_instance" "default" {
  name             = "${var.instance_name}-${random_id.id.hex}"
  database_version = var.database_version
  region           = var.region
  deletion_protection = false

  settings {
    tier = var.tier
    ip_configuration {
      ipv4_enabled = true
    }
  }
}

resource "google_sql_database" "example" {
  name     = var.dbname
  instance = google_sql_database_instance.default.name
}

# Example of creating a user for the database
resource "google_sql_user" "users" {
  name     = var.username
  instance = google_sql_database_instance.default.name
  password = var.password
}

# Create a random id
resource "random_id" "id" {
  byte_length = 4
}