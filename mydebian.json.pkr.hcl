source "yandex" "debian_docker" {
  disk_type           = "network-hdd"
  folder_id           = "XXXXXXXXXXXXXXXXXXXXXXXXXX"
  image_description   = "my custom debian with docker"
  image_name          = "debian-11-dockerv2"
  source_image_family = "debian-11"
  ssh_username        = "debian"
  subnet_id           = "XXXXXXXXXXXXXXXXXXXXXXXXX"
  token               = "XXXXXXXXXXXXXXXXXXXXXXXXXX"
  use_ipv4_nat        = true
  zone                = "ru-central1-a"
}

build {
  sources = ["source.yandex.debian_docker"]

  provisioner "shell" {
    inline = [
"echo 'hello from packer'",
"sudo sed -i '/bullseye-backports/d' /etc/apt/sources.list",
"sudo apt-get update -y",
"sudo apt-get install htop tmux docker docker-compose -y",
"docker --version", "docker-compose version"]
  }

}
