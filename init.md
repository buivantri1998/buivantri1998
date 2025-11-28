

gcloud services enable compute.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com

gcloud services enable container.googleapis.com


project=user-hgsffypsjrgd
user=buivantri1998@outlook.com
gcloud projects add-iam-policy-binding $project \
  --member="user:$user" \
  --role="roles/editor"

project=user-hgsffypsjrgd
gcloud config set project $project

gcloud compute instances create test-vm --machine-type e2-micro --zone=us-central1-a
gcloud container clusters create-auto hello-cluster --location=us-central1

gcloud compute instances delete test-vm --zone=us-central1-a
gcloud container clusters delete hello-cluster --region us-central1

git config --global user.email "tri.bui@tribui.com"
git config --global user.name "Tri Bui"

packer init main.pkr.hcl
packer validate main.pkr.hcl
packer build main.pkr.hcl

terraform init
terraform plan
terraform apply --auto-approve
terraform destroy --auto-approve

gcloud compute images delete packer-nginx-1764299997