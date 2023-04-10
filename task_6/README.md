
https://storage.googleapis.com/dareit2024bucket/index.html



# using Terraform


Open Cloud Shell and check the version of Terraform using the below command:
terraform version
Create a file called main.tf
In order to be able to communicate with GCP API we need to configure a provider. A provider in Terraform is a plugin that enables interaction with an API.
provider configuration.


provider "google" {
  project = "{{YOUR GCP PROJECT}}"
  region  = "us-central1"
  zone    = "us-central1-c"
}

In order for the provider to be configured replace the {{YOUR GCP PROJECT}} with your project id

Now we need to add the configuration for the resource itself. And for the we can use the docs again, to figure out what kind of parameters we need to supply in the code.
https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance￼/


vim main.tf

Paste the code in the main.tf file.

provider "google" {
  project = "mindful-hall-377614"
  region  = "us-central1"
  zone    = "us-central1-c"
}


resource "google_compute_instance" "dare-id-vm" {
  name         = "dareit-vm-tf"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["dareit"]

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
 initialize terraform. Run the below command in the Cloud Shell.
 
 terraform init
 terraform plan
 terraform apply
 
 Go to the VM Instances in the UI. 
 Check out the configuration of the dare-it-vm-tf . Scroll down to see the boot disk.
 
 ist the files that are now in the directory from which you're running the terraform apply command. Use ls
 
 u can use cat command to view the content of the file.
 
 cat terraform.tfstate
 
 Remove the network tag and hit SAVE it
 
 go back to the CloudShell and run terraform plan again.
 
 Terraform detected the definition of the resource from the main.tf file and the actual configuration of the resource in GCP are different. To make it aligned with the definition in the main.tf Terraform proposes changes to the tags.

Run terraform apply and confirm. Check the UI again, then the network tag should be there again.
Now let’s remove the resource using Terraform. vim main.tf. Delete the block describing the resource "google_compute_instance" "dare-it-vm-tf"

Run the terraform plan

you can see Terraform will destroy the resource for us. Let’s do terraform apply and confirm.

Check the UI. The dare-it-vm-tf VM Instance is no longer there.

TASK

Create main.tf file, configure the provider and add configuration to create resources: 

Cloud Storage bucket that has public access configured

Compute Instance
Cloud SQL instance with Postgres engine. Create database called dareit and a user called dareit_use


Manually change the password of the dareit_user

Upload manually the index.html file (that you previously created in Task 1) into the newly created bucket

Create a new folder in your cloud_challenge repo with name task_6 , commit the main.tf file
Copy the URL of the object (index.htm) from your bucket and add it to readme.md.
