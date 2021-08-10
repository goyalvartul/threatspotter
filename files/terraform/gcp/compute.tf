// Deepfence Management Console
resource "google_compute_instance" "deepfence-management-console" {
  name = var.hostname
  machine_type = var.machine_type
  zone = var.region
  tags = [
    "deepfence-management-console"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20200610"
      size = 120
    }
  }

  network_interface {
    network = google_compute_network.deepfence_network.name

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  metadata = {
    ssh-keys = "${var.username}:${file(var.ssh_public_key)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install apt-transport-https ca-certificates curl software-properties-common wget git htop -y",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository \"deb https://download.docker.com/linux/$(. /etc/os-release; echo \"$ID\") $(lsb_release -cs) stable\"",
      "sudo apt-get update",
      "sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu",
      "sudo usermod -a -G docker \"$(id -un)\"",
      "sudo curl -L \"https://github.com/docker/compose/releases/download/1.20.1/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose",
      "sudo chmod 755 /usr/local/bin/docker-compose",
    ]

    connection {
      type = "ssh"
      user = var.username
      private_key = file(var.ssh_private_key)
      host = self.network_interface.0.access_config.0.nat_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "cd /home/${var.username}",
      "git clone https://github.com/deepfence/ThreatMapper.git",
      "docker-compose -f /home/${var.username}/ThreatMapper/files/docker-compose.yml up -d"
    ]

    connection {
      type = "ssh"
      user = var.username
      private_key = file(var.ssh_private_key)
      host = self.network_interface.0.access_config.0.nat_ip
    }
  }
}

