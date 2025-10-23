
# 🧭 AKS DevOps Platform — Terraform Infrastructure

✅ **Stable configuration verified:** 2025-10-24  
This project provisions a full **Enterprise AKS + DevOps Platform** on Azure using Terraform.

## 🚀 Components

| Module | Description |
|---------|--------------|
| network | Creates VNet and AKS subnet |
| monitoring | Deploys Log Analytics Workspace |
| aks | Creates AKS cluster with AAD RBAC and monitoring enabled |

## ⚙️ Terraform Versions
- Terraform: `v1.9.x`
- Provider: `azurerm >= 4.49.0`
- Backend: Local or Azure Storage

## 🧠 Usage

```bash
cd envs/dev
terraform init -upgrade
terraform validate
terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars -auto-approve

```
📁 Repository Structure
```
aks-devops-platform/
├── app/                     # Sample Node.js app (containerized)
│   ├── package.json
│   └── server.js
│
├── charts/                  # Helm chart for Kubernetes app deployment
│   └── sample-app/
│       ├── Chart.yaml
│       ├── templates/
│       └── values.yaml
│
├── envs/
│   └── dev/
│       ├── backend.tf        # Remote backend (Azure Storage)
│       ├── providers.tf      # Provider configurations
│       ├── variables.tf      # Variable definitions
│       ├── dev.tfvars        # Environment-specific values
│       └── main.tf           # Root module composition
│
├── modules/                  # Reusable Terraform modules
│   ├── aks/                  # AKS Cluster
│   ├── network/              # VNet and Subnets
│   ├── monitoring/           # Log Analytics
│   └── keyvault/             # (Future module for secrets)
│
├── Dockerfile                # Containerize the app
├── .gitignore                # Ignore Terraform state and local artifacts
└── README.md                 # This file
```
⚙️ Deployment Steps
1️⃣
 Prerequisites

Ensure the following tools are installed:

# For macOS
brew install terraform azure-cli kubectl helm


Authenticate to Azure:

az login
az account set --subscription "<subscription_id>"

2️⃣ Initialize Terraform Backend

Navigate to your environment:

cd envs/dev
terraform init

3️⃣ Review the Plan
terraform plan -var-file=dev.tfvars

4️⃣ Apply the Deployment
terraform apply -var-file=dev.tfvars -auto-approve


Expected Resources:

Resource Group

Virtual Network + Subnet

AKS Cluster

Log Analytics Workspace

Azure Container Registry (ACR)

```
🧱 Modules Overview
Module	Description	Key Resources
network			Creates VNet and Subnet for AKS	azurerm_virtual_network, azurerm_subnet
monitoring		Creates Log Analytics Workspace for monitoring	azurerm_log_analytics_workspace
aks			Provisions AKS cluster with RBAC, monitoring, and AAD integration	azurerm_kubernetes_cluster
keyvault		(Planned) For secret management integration	azurerm_key_vault
🐳 App Containerization (Optional)
```
To build and push the app image to ACR:

az acr login --name <acr_name>
docker build -t <acr_name>.azurecr.io/sample-app:v1 .
docker push <acr_name>.azurecr.io/sample-app:v1

⛵ Helm Deployment

Once the AKS context is configured:

az aks get-credentials --resource-group dev-rg --name dev-aks
helm install sample-app ./charts/sample-app --set image.repository=<acr_name>.azurecr.io/sample-app,image.tag=v1

🧩 Next Phase (CI/CD Integration)

Future enhancement using GitHub Actions or Azure DevOps Pipelines:

Terraform Plan & Apply (Infra-as-Code workflow)

Docker Build & Push to ACR

Helm Deploy to AKS

Post-deployment Monitoring with Azure Monitor

📊 Monitoring

The Log Analytics Workspace integrates directly with AKS to enable:

Container insights (CPU, memory, node utilization)

Cluster logs

Application metrics

Access via:

Azure Portal → Monitor → Logs → Container Insights

🏁 Project Highlights
```
✅ Modular Terraform design
✅ Remote backend with state locking
✅ Secure, scalable AKS setup
✅ App containerization + Helm
✅ CI/CD ready architecture
✅ Enterprise-grade monitoring
```
👤 Author

Sudhir D.
Cloud & Infrastructure Architect | Azure & DevOps Specialist
🔗 GitHub Profile
