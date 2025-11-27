
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install packer terraform

buivantri1998@cloudshell:~/buivantri1998$ terraform version
Terraform v1.14.0
on linux_amd64
buivantri1998@cloudshell:~/buivantri1998$ packer version
Packer v1.14.3
buivantri1998@cloudshell:~/buivantri1998$ 

sudo apt install ansible-core -y

buivantri1998@cloudshell:~/buivantri1998$ ansible --version
ansible [core 2.16.3]
  config file = None
  configured module search path = ['/home/buivantri1998/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/buivantri1998/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.12.3 (main, Aug 14 2025, 17:47:21) [GCC 13.3.0] (/usr/bin/python3)
  jinja version = 3.1.6
  libyaml = True