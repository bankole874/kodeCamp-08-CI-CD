# kodecamp-08-CI-CD

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

## Application Structure
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



-
-
-
![dockerhub](https://github.com/user-attachments/assets/c27896f6-d9a2-41f2-aca7-cf84552ec2b1)
![complete_job](https://github.com/user-attachments/assets/c447ac25-765a-41f7-802e-043110a1430f)
![minikube_status](https://github.com/user-attachments/assets/3982cd89-055d-4cfd-b241-795b7fe37073)
![files_preview](https://github.com/user-attachments/assets/ab194a50-bbd5-4707-b42c-ef01c9630dfb)

![ssh_and_minikube_status](https://github.com/user-attachments/assets/106e6f60-44b7-4063-a367-38716067aa62)
