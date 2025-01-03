# Create a new instance that uses the bucket

resource "google_compute_instance" "another_instance" {



  name         = "terraform-instance-2"

  machine_type = "e2-micro"

  boot_disk {

    initialize_params {

      image = "debian-cloud/debian-11"

    }

  }

  network_interface {

    network = "default"

    access_config {

    }

  }

  # Tells Terraform that this VM instance must be created only after the

  # storage bucket has been created.

  depends_on = [google_storage_bucket.example_bucket]

}

# New resource for the storage bucket our application will use.
resource "google_storage_bucket" "example_bucket" {
  name     = "qwiklabs-gcp-02-2526014e3b0e-2024-11-02"
  location = "US"
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
