# AWS Infrastructure Provisioning with Terraform (VPC, ECR & EKS)

Provision a complete AWS infrastructure using **Terraform** to deploy containerized applications on **Amazon Elastic Kubernetes Service (EKS)**.

This project follows Infrastructure as Code (IaC) principles by creating networking, container registry, and Kubernetes resources through reusable Terraform modules.

---

## Overview

This project automates the provisioning of AWS infrastructure using **Terraform**.

Running a single command:

```bash
terraform apply
```

creates the complete infrastructure, including:

- Amazon VPC
- Public & Private Subnets
- Internet Gateway
- Route Tables
- Security Groups
- Amazon ECR Repository
- Amazon EKS Cluster
- Managed Node Group
- IAM Roles and Policies

Once the infrastructure is provisioned, a Dockerized application can be pushed to Amazon ECR and deployed to the EKS cluster using Kubernetes manifests.

---

## Architecture

```
Terraform
     │
     ▼
┌───────────────────────────────┐
│          AWS Cloud            │
│                               │
│  ┌──────────────┐             │
│  │     VPC      │             │
│  └──────┬───────┘             │
│         │                     │
│  Public & Private Subnets     │
│         │                     │
│  ┌──────▼───────┐             │
│  │     EKS      │             │
│  └──────┬───────┘             │
│         │                     │
│ Kubernetes Worker Nodes       │
│         │                     │
│  ┌──────▼───────┐             │
│  │ Docker Image │◄────────ECR │
│  └──────────────┘             │
└───────────────────────────────┘
         │
         ▼
 Kubernetes Deployment
         │
         ▼
   LoadBalancer Service
         │
         ▼
      End Users
```

---

## Key Features

- Infrastructure provisioned using **Terraform**
- Modular Terraform architecture
- Reusable VPC, ECR, and EKS modules
- Managed Kubernetes cluster on AWS
- Docker image storage with Amazon ECR
- Kubernetes deployment using YAML manifests
- Infrastructure managed with a single `terraform apply`
- Easy resource cleanup using `terraform destroy`

---

## Deployment

Provision the infrastructure:

```bash
terraform init

terraform plan

terraform apply
```

Configure Kubernetes:

```bash
aws eks update-kubeconfig --region <region> --name <cluster-name>
```

Deploy the application:

```bash
kubectl apply -f k8s/
```

Destroy all resources:

```bash
terraform destroy
```


## Author

**Hritik Jaiswal**

DevOps | AWS | Terraform | Docker | Kubernetes
