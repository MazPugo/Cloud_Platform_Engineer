
provider "google" {
  project = "neat-resolver-378118"
  region  = "europe-west2"
  zone    = "europe-west2-c"
  credentials = var.gcp-creds
}


variable "gcp-creds" {
default= ""
}


resource "google_storage_bucket" "dareit" {
  name = "dareit2024bucket"
  location = "europe-west2"
  storage_class = "STANDARD"
  labels = {
   "key1" = "value1"
   "key2" = "value2"
 }
} 


resource "google_compute_instance" "terraform-id-vp" {
  name         = "terraform-vp-tf"
  machine_type = "e2-medium"
  zone         = "europe-west2-c"

  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        managed_by_terraform = "true"
      }
    }
}


  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}

resource "random_id" "db_name_suffix" {
  byte_length = 4
}
resource "google_sql_database_instance" "postgres" {
  name = "postgres-instance-${random_id.db_name_suffix.hex}"
  database_version = "POSTGRES_11"
  
  settings{
    tier = "db-f1-micro"
    user_labels = {
      "environment" = "development"
    }
    backup_configuration {
      enabled = true
      start_time = "04:30"
    }
  }
}
resource "google_sql_user" "users" {
  name     = "dareit_user"
  instance = google_sql_database_instance.postgres.name
  password = "changeme"
}
resource "google_sql_database" "database" {
  name     = "dareit"
  instance = google_sql_database_instance.postgres.name
}