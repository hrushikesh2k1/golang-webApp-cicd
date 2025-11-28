# Go Web Application

This is a simple website written in Golang. It uses the `net/http` package to serve HTTP requests.

## Running the server

To run the server, execute the following command:

```bash
go run main.go
```

The server will start on port 8080. You can access it by navigating to `http://localhost:8080/courses` in your web browser.

## Looks like this

![Website](static/images/golang-website.png)

## pre-requisite

Azure account with access to Azure Container registry, Azure Kubernetes Service, Azure VMSS & VM.

## Steps to follow for Continuous Integration (CI)

1. Login to Azure DevOps.
2. Create the project > Go to Repo's section > Import the repo from GitHub.
3. Go to Pipeline section and Create New pipeline > select the template as Docker Build and Push.
4. You will be seeing the yaml file. Change the yaml according to the yaml file given in this repo (azure-pipeline.yaml).
5. Run the pipeline by selecting the azure default pool or select self hosted pool by creating a VM in azure and configuring it as agent pool.

## Steps to follow for Continuous Deployment (CD)

1. Install Azure cli in your machine(linux).
```
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```
2. Install Kubectl for interacting with AKS.
```
  sudo snap install kubectl --classic
```
3. Create the Kubernetes cluster in azure, after that configure it using below command
```
az aks get-credentials --name k8s --overwrite-existing --resource-group azure-devops-demo
```
4. configure argocd
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

