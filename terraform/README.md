Use Following Commands to Create EKS Cluster Using Terraform:

terraform init 

terraform validate 

terraform plan 

terraform apply

After creating this Cluster Use this command with your region and cluster name to update kube-config

aws eks update-kubeconfig --region region-code --name my-cluster

To check if you can access your cluster use the following command

kubectl cluster-info

kubectl get nodes -A 




