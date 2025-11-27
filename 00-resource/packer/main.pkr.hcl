packer {
  required_plugins {
    googlecompute = {
      version = ">= 1.1.3"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}


source "googlecompute" "nginx" {
  project_id        = "user-hilqeryglwqo"
  source_image_family = "debian-12"
  zone              = "asia-southeast1-b"
  machine_type      = "e2-medium"
  image_name        = "packer-nginx-{{timestamp}}"
  image_family      = "nginx-base"
  image_description = "Custom Nginx base image built by Packer"
  ssh_username      = "packer"
  use_os_login      = false
  tags              = ["packer-build"]

  # Tự động xoá VM tạm nếu lỗi
  temporary_key_pair_type = "ed25519"
}

build {
  name    = "gcp-nginx-image"
  sources = ["source.googlecompute.nginx"]

  provisioner "shell" {
    script = "scripts/install_nginx.sh"
  }

  provisioner "shell" {
    script = "scripts/cleanup.sh"
  }

  // post-processor "manifest" {
  //   output = "packer-manifest.json"
  // }
}
