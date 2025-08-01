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
