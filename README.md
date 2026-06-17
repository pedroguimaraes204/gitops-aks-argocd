# GitOps AKS ArgoCD

A fully automated GitOps pipeline running on Azure Kubernetes Service (AKS), 
provisioned with Terraform and powered by ArgoCD and GitHub Actions.

## Architecture

**Infrastructure (Terraform)**
- Virtual Network with subnets and NSGs
- AKS cluster with SystemAssigned identity
- Azure Container Registry (ACR)
- Remote state backend on Azure Storage Account with state locking

**GitOps Flow (ArgoCD + GitHub Actions)**

Every push to `main` triggers the following flow:

1. GitHub Actions builds the Docker image
2. Pushes the image to ACR tagged with the commit SHA
3. Updates the Kubernetes manifest with the new image tag
4. ArgoCD detects the manifest change and syncs the cluster
5. Kubernetes recreates the pods with the new image

## Tech Stack

- **Terraform** — Infrastructure as Code
- **Azure Kubernetes Service** — Container orchestration
- **Azure Container Registry** — Docker image registry
- **ArgoCD** — GitOps continuous delivery
- **GitHub Actions** — CI pipeline
- **FastAPI** — Sample application
- **Helm** — ArgoCD installation
- **Docker** — Container runtime

## Repository Structure

gitops-aks-argocd/

├── terraform/

│   ├── modules/

│   │   ├── aks/

│   │   ├── vnet/

│   │   └── acr/

│   ├── main.tf

│   └── backend.tf

├── k8s/

│   ├── apps/

│   │   ├── deployment.yaml

│   │   └── service.yaml

│   └── argocd/

│       └── application.yaml

├── app/

│   ├── main.py

│   └── Dockerfile

└── .github/

└── workflows/

└── ci.yml

## How to Use

**Prerequisites:** Azure CLI, Terraform, kubectl, Helm

**1. Provision infrastructure**
```bash
cd terraform
terraform init
terraform apply
```

**2. Get AKS credentials**
```bash
az aks get-credentials --resource-group rg-gitops-dev --name dev-aks1
```

**3. Install ArgoCD**
```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd --namespace argocd --create-namespace
```

**4. Apply ArgoCD Application**
```bash
kubectl apply -f k8s/apps/application.yaml
```

**5. Push any change to `app/` and watch the magic happen**
```bash
git push origin main
```

Author
Pedro Guimarães — Cloud Engineer