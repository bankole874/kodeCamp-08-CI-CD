# CI/CD Pipeline with GitHub Actions, Terraform, Minikube, and Kubernetes

## Introduction
This project demonstrates the setup of a CI/CD pipeline using GitHub Actions to deploy an application from a GitHub repository to a Minikube cluster running on an AWS EC2 instance. The infrastructure is provisioned using Terraform, and the application is containerized with Docker.

The application is a simple Flask web app that displays the message `"Hello, Welcome to KodeCamp DevOps Bootcamp!"`.

## Table of Contents
* Prerequisites
* Setup
* Challenges Faced
* Contributing

## Prerequisites

- An AWS account with IAM permissions to create EC2 instances.
- Terraform installed on local machine.
- A Docker Hub account (bankdoo) for storing Docker images.
- SSH key (kckey_rsa) configured for secure access to the EC2 instance.
- A GitHub repository for your application code.

## Project Structure
```bash
kodeCamp-08-CI-CD
├── .github/workflows
│   └── deploy.yml
├── kubernetes
│   ├── configmap.yaml
│   ├── deployment.yaml
│   ├── secret.yaml
│   └── service.yaml
├── terraform
│   ├── modules/...
│   └── scripts
│       └── install_minikube.sh
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── Dockerfile
├── README.md
└── requirements.txt
```

## Setup
### Prepare the Code Repository
Create a new repository on GitHub to store application code.
example `kodeCamp-08-CI-CD`.

- Create Kubernetes Manifests
- Create GitHub Actions Workflow
- Create Terraform modules to provision the EC2 instance, VPC, and related resources.

![files_preview](https://github.com/user-attachments/assets/ab194a50-bbd5-4707-b42c-ef01c9630dfb)

### Initialize and Apply Terraform Configuration
```
terraform init
terraform plan -out=tfplan -json
terrafrm apply
```

### Access the Minikube Cluster
```
ssh -i "<private key>.pem" <user>@<instance IP>
```
![ssh_and_minikube_status](https://github.com/user-attachments/assets/106e6f60-44b7-4063-a367-38716067aa62)

### Update the GitHub Actions workflow

```
# deploy.yml
...
 deploy:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up SSH agent
        uses: webfactory/ssh-agent@v0.5.3
        with:
          ssh-private-key: ${{ secrets.SSH_PRIVATE_KEY }}

      - name: Add EC2 instance to known hosts
        run: |
          ssh-keyscan -H ${{ secrets.EC2_IP }} >> ~/.ssh/known_hosts

      - name: Deploy to Minikube
        run: |
          scp -r kubernetes ubuntu@${{ secrets.EC2_IP }}:~/kubernetes
          ssh ubuntu@${{ secrets.EC2_IP }} << 'EOF'
          kubectl apply -f ~/kubernetes/secret.yaml
          kubectl apply -f ~/kubernetes/configmap.yaml
          kubectl apply -f ~/kubernetes/service.yaml
          kubectl apply -f ~/kubernetes/deployment.yaml
          EOF
```

### Automate Deployment with GitHub Actions
![complete_job](https://github.com/user-attachments/assets/c447ac25-765a-41f7-802e-043110a1430f)

### Confirm Build and Deploy
- Docker Hub image
![dockerhub](https://github.com/user-attachments/assets/c27896f6-d9a2-41f2-aca7-cf84552ec2b1)
- Get kubernetes pods
```
kubectl get pods
```
![kubectl_get_pods](https://github.com/user-attachments/assets/be403a83-7b44-4652-9551-449c6366c42d)

- Port-forwarding
```
kubectl get services
kubectl port-forward service/<service name> 8080:80
curl -i http://<local-host>:8080
```
![port-forwarding](https://github.com/user-attachments/assets/6000901a-5fca-4574-a44b-1fcd33e02e3f)

### Challenges Faced
During the setup of this CI/CD pipeline, several challenges were encountered:

- SSH Key Authentication
The Permission denied (publickey) error occurred due to improper SSH key configuration. This was resolved by ensuring the correct SSH key was used and properly formatted in GitHub secrets.

- Host Key Verification Failed
The error Host key verification failed was encountered during the deployment step. This was addressed by using ssh-keyscan to dynamically add the EC2 instance's SSH key to the known_hosts file in the GitHub Actions workflow.

- Terraform and Minikube Configuration
Setting up Terraform to correctly provision an EC2 instance with Minikube required fine-tuning the configurations to ensure Minikube started correctly and could be accessed via SSH.

- Docker and Kubernetes Integration
Ensuring the Docker image was correctly built, pushed, and deployed to the Kubernetes cluster required careful management of Docker and Kubernetes configurations, particularly around handling environment variables and secrets.

### Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your changes.
