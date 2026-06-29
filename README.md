# AWS Infrastructure Provisioning with Terraform (VPC, ECR & EKS)

Provision a complete AWS infrastructure using **Terraform** to deploy containerized applications on **Amazon Elastic Kubernetes Service (EKS)**.

This project follows Infrastructure as Code (IaC) principles by creating networking, container registry, and Kubernetes resources through reusable Terraform modules.

---

## Project Structure

```text
.
├── app
│   ├── Dockerfile
│   ├── index.html
│   └── style.css
├── k8s
│   ├── deployment.yml
│   └── service.yml
├── modules
│   ├── ecr
│   │   ├── ecr.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   ├── eks
│   │   ├── eks.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   └── vpc
│       ├── output.tf
│       └── vpc.tf
├── backend.tf
├── main.tf
├── output.tf
├── provider.tf
├── trust-policy.json
└── variable.tf
```

---

## Architecture

The project provisions:

- AWS VPC
- Amazon EKS Cluster
- Amazon ECR Repository
- Kubernetes Deployment
- Kubernetes Service

Workflow:

```
Terraform
     │
     ▼
Provision AWS Infrastructure
     │
     ├── VPC
     ├── EKS
     └── ECR
     │
     ▼
Build Docker Image
     │
     ▼
Push Image to ECR
     │
     ▼
Deploy Application to EKS
```

---

## Prerequisites

Make sure the following tools are installed:

- Terraform >= 1.5
- AWS CLI
- kubectl
- Docker
- Git

Configure AWS credentials:

```bash
aws configure
```

---

## Terraform Modules

### VPC Module

Creates:

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- Route Tables

---

### EKS Module

Creates:

- Amazon EKS Cluster
- Managed Node Group
- IAM Roles

---

### ECR Module

Creates:

- Amazon Elastic Container Registry repository

---

## Deploy Infrastructure

Initialize Terraform:

```bash
terraform init
```

Validate:

```bash
terraform validate
```

Review the execution plan:

```bash
terraform plan
```

Create infrastructure:

```bash
terraform apply
```

---

## Build Docker Image

Navigate to the application directory:

```bash
cd app
```

Build the Docker image:

```bash
docker build -t my-app .
```

---

## Push Image to Amazon ECR

Authenticate Docker:

```bash
aws ecr get-login-password --region <region> \
| docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com
```

Tag the image:

```bash
docker tag my-app:latest <account-id>.dkr.ecr.<region>.amazonaws.com/my-app:latest
```

Push:

```bash
docker push <account-id>.dkr.ecr.<region>.amazonaws.com/my-app:latest
```

---

## Configure kubectl

Update kubeconfig:

```bash
aws eks update-kubeconfig \
--region <region> \
--name <cluster-name>
```

Verify:

```bash
kubectl get nodes
```

---

## Deploy Application

Deploy:

```bash
kubectl apply -f k8s/deployment.yml
kubectl apply -f k8s/service.yml
```

Verify:

```bash
kubectl get pods
kubectl get svc
```

---

## Destroy Infrastructure

To remove all AWS resources:

```bash
terraform destroy
```

---

## Variables

Common variables include:

| Variable | Description |
|----------|-------------|
| aws_region | AWS Region |
| cluster_name | EKS Cluster Name |
| vpc_cidr | VPC CIDR Block |
| node_instance_type | EC2 Instance Type |
| desired_capacity | Desired Worker Nodes |

---

## Outputs

Terraform outputs may include:

- EKS Cluster Name
- Cluster Endpoint
- ECR Repository URL
- VPC ID
- Subnet IDs

---

## Security

- IAM Roles for EKS
- Least-privilege access
- Terraform state stored remotely (configured in `backend.tf`)
- Trust policy defined in `trust-policy.json`

---

## Future Enhancements

- Helm Charts
- AWS Load Balancer Controller
- Ingress Controller
- HTTPS with ACM
- GitHub Actions CI/CD
- Monitoring using Prometheus and Grafana
- Logging using CloudWatch

---

## Author

**Hritik Jaiswal**

DevOps | AWS | Terraform | Docker | Kubernetes
