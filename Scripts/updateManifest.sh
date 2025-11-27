#!/bin/bash

set -x

# Set the repository URL
REPO_URL="https://<Azure-devops-org-PAT>@dev.azure.com/peningwhatheartsays/go-web-application/_git/go-web-application"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file
#for example, let's say you want a change the image tag in a deployment.yml file
sed -i "s|image:.*|image: hrushikeshazurecicd.azurecr.io/gowebapplication:$1|g" k8s/deployment.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo
