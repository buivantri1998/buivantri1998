

gcloud services enable compute.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com

gcloud services enable container.googleapis.com


project=user-hilqeryglwqo
user=buivantri1998@outlook.com
gcloud projects add-iam-policy-binding $project \
  --member="user:$user" \
  --role="roles/editor"

project=user-hilqeryglwqo
gcloud config set project $project

gcloud compute instances create test-vm --machine-type e2-micro --zone=us-central1-a
gcloud container clusters create-auto hello-cluster --location=us-central1

gcloud compute instances delete test-vm --zone=us-central1-a
gcloud container clusters delete hello-cluster --region us-central1

git config --global user.email "tri.bui@tribui.com"
git config --global user.name "Tri Bui"

packer init gcp_nginx.pkr.hcl
packer validate gcp_nginx.pkr.hcl
packer build gcp_nginx.pkr.hcl