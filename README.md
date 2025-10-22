# Enterprise AKS + DevOps Platform

## Overview
This project provisions an enterprise-grade AKS cluster, integrates CI/CD using GitHub Actions, and sets up monitoring using Azure Monitor and Log Analytics.

## Components
- **Terraform Modules** for reusable infrastructure code
- **AKS** cluster with AAD RBAC
- **Azure Container Registry (ACR)** for image storage
- **GitHub Actions CI/CD** workflow for automated build and deploy
- **Azure Monitor** and **Log Analytics** for observability

## Deployment
1. Configure Terraform backend and Azure credentials.
2. Run `terraform init`, `terraform plan`, and `terraform apply` under `envs/dev`.
3. Push code to GitHub to trigger the CI/CD workflow.

## Recommended Sizes for Sandbox
- Node size: `Standard_B2ms`
- Node count: `2`
- ACR SKU: `Basic`
- Monitoring: Enabled

Average monthly cost on $200 sandbox: ~$60–70.