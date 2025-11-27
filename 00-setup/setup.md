
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install packer terraform

buivantri1998@cloudshell:~/buivantri1998$ terraform version
Terraform v1.14.0
on linux_amd64
buivantri1998@cloudshell:~/buivantri1998$ packer version
Packer v1.14.3
buivantri1998@cloudshell:~/buivantri1998$ 

