# Medusa AWS ECS Deployment

This project sets up the **Medusa backend** on **AWS ECS (Fargate)** using **Terraform** for infrastructure provisioning and **GitHub Actions** for CI/CD deployment.

---

## 🧱 Project Structure

```bash
medusa-aws-ecs/
├── terraform/
│   ├── main.tf              # Entry point for Terraform
│   ├── variables.tf         # Input variables
│   ├── outputs.tf           # Outputs after deployment
│   ├── network.tf           # VPC, subnets, internet gateway, routing
│   ├── rds.tf               # RDS PostgreSQL database
│   ├── ecs.tf               # ECS cluster, services, task definitions
│   ├── alb.tf               # Application Load Balancer and target groups
│   ├── iam.tf               # IAM roles and policies for ECS tasks
├── .github/
│   └── workflows/
│       └── deploy.yml       # GitHub Actions CI/CD pipeline
├── docker/
│   └── Dockerfile           # Containerization of the Medusa backend
├── src/                     # Medusa backend source code (cloned from GitHub)
├── README.md                # Project documentation
```

---

## 🚀 Features

- **High Availability:** Deploys across two subnets in different availability zones (ap-south-1a and ap-south-1b)
- **Managed RDS Database:** PostgreSQL backend for Medusa
- **Load Balanced:** Application Load Balancer distributes traffic
- **Auto-scaling:** ECS Fargate configuration is scalable
- **Secure:** Security groups and IAM roles configured
- **Automated Deployments:** CI/CD with GitHub Actions

---

## 🔧 Tools Used

- **Terraform** — Infrastructure as Code
- **AWS ECS (Fargate)** — Container orchestration
- **Amazon RDS** — Managed PostgreSQL
- **GitHub Actions** — Continuous Deployment
- **Docker** — Application packaging

---

## 💪 Prerequisites

- AWS account with appropriate IAM permissions
- Terraform CLI installed (`>= 1.3.0`)
- GitHub repository connected
- Docker installed (for local builds)
- AWS CLI configured with access keys
- Medusa backend cloned into `src/`

---

## ⚙️ Setup Instructions

### 1. Clone the Repo

```bash
git clone https://github.com/your-username/medusa-aws-ecs.git
cd medusa-aws-ecs/terraform
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Set Variables (Optional)

Edit `variables.tf` or use a `terraform.tfvars` file to customize values.

### 4. Deploy Infrastructure

```bash
terraform apply
```

### 5. Setup GitHub Actions

- Configure secrets in your GitHub repo:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_REGION`
- Push your code to trigger the pipeline:
  ```bash
  git add .
  git commit -m "initial deploy"
  git push origin main
  ```

---

## 📦 Outputs

After deployment, Terraform will output:

- ALB DNS Name (your public endpoint)
- RDS Endpoint
- ECS Cluster and Service info

---

## 📌 Notes

- Make sure your VPC and subnets exist and are correct.
- Adjust the Medusa backend port in your ALB target group if needed.
- You can scale ECS tasks or add auto-scaling policies as needed.

---

