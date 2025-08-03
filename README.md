# Multi-Cloud-Flask
This project demonstrates how to provision and deploy a Dockerized Python Flask application simultaneously on AWS and Azure using Kubernetes (EKS & AKS), with Terraform as infrastructure-as-code and GitHub Actions for CI/CD. It highlights a multi-cloud strategy for resilience, portability, and vendor-neutral architecture.

# Multi-Cloud Flask App (Phase 1)

This is Phase 1 of a multi-cloud deployment project that demonstrates running a containerized Flask app on both AWS (EKS) and Azure (AKS). In this phase, we:
- Build a simple Python Flask API
- Containerize it using Docker
- Run and test it locally

## 📁 Folder Structure

multi-cloud-flask/
├── app/
│   ├── main.py
│   └── requirements.txt
├── Dockerfile
├── .dockerignore
├── README.md


## 🚀 How to Run Locally with Docker

```bash
# Build the Docker image
docker build -t flask-multicloud .

# Run the container
docker run -d -p 5000:5000 flask-multicloud

# Test it
curl http://localhost:5000/health
curl http://localhost:5000/version

## 🔍 Endpoints

- `GET /health` → `{ "status": "OK" }`
- `GET /version` → `{ "version": "1.0.0" }`

## 📌 Next Phases

This project will grow to include:

- Terraform IaC (AWS + Azure)
- EKS and AKS deployments
- GitHub Actions CI/CD
- GitOps with ArgoCD
- Monitoring and Observability
---

## 📂 .gitignore (Recommended)

Create this in your project root to avoid committing unnecessary files:

```gitignore
__pycache__/
*.pyc
*.pyo
*.pyd
.env
*.db
*.sqlite3
.DS_Store
docker-compose.override.yml
*.log
*.tar
.env.*
.vscode/
.idea/


# Step into your project directory
cd multi-cloud-flask

# Initialize Git
git init

# Add remote (replace with your actual repo URL)
git remote add origin https://github.com/yourusername/multi-cloud-flask.git

# Stage everything
git add .

# Commit with a clear message
git commit -m "Phase 1: Flask app and Docker container setup"

# Push to main branch
git branch -M main
git push -u origin main

## 🛠 Phase 2: Provision AWS Infrastructure (EKS)

We used Terraform to provision:
- A VPC with public and private subnets
- An EKS cluster
- A managed node group with autoscaling

### 🧪 How to Run

```bash
cd terraform/aws
terraform workspace new aws
terraform init
terraform plan
terraform apply -auto-approve
aws eks --region us-east-1 update-kubeconfig --name flask-multicloud-eks
kubectl get nodes


---

## 🧑‍💻 GitHub Push Instructions (Phase 2)

```bash
# Stage only AWS Terraform folder
cd multi-cloud-flask
git add terraform/aws
git commit -m "Phase 2: Provision AWS EKS cluster with Terraform"
git push origin main

## ☁️ Phase 3: Provision Azure AKS with Terraform

In this phase, we:
- Logged into Azure CLI
- Created a resource group, VNet, and subnet
- Provisioned an AKS cluster with Terraform
- Verified `kubectl` access to the cluster

### 🧪 Commands

```bash
az login
cd terraform/azure
terraform init
terraform workspace new azure
terraform apply -auto-approve

az aks get-credentials \
  --resource-group flask-azure-rg \
  --name flask-multicloud-aks

kubectl get nodes


---

## 🧑‍💻 GitHub Push Instructions (Phase 3)

```bash
cd multi-cloud-flask
git add terraform/azure
git commit -m "Phase 3: Provision Azure AKS cluster with Terraform"
git push origin main

## 🚀 Phase 4: Deploy Flask App to EKS and AKS Using Helm

In this phase, we:
- Created a Helm chart to package the app
- Switched Kubernetes context between EKS and AKS
- Used Helm to deploy the app to both clusters
- Verified public access via LoadBalancer IP

### Example Command

```bash
kubectl config use-context flask-multicloud-aks
helm install flask-app ./helm/flask-app
kubectl get svc


---

## 🧑‍💻 GitHub Push Instructions (Phase 4)

```bash
cd multi-cloud-flask
git add helm/
git commit -m "Phase 4: Deploy Flask app to EKS and AKS using Helm"
git push origin main

## 🔁 Phase 5: CI/CD with GitHub Actions (EKS + AKS)

In this phase, we:
- Created private container registries on AWS (ECR) and Azure (ACR)
- Built and pushed our Flask Docker image via GitHub Actions
- Updated our Helm deployment to use the new image
- Automatically redeployed the app to both EKS and AKS on push to main

### Key Technologies
- GitHub Actions
- ECR & ACR
- Docker Buildx
- Helm CLI

