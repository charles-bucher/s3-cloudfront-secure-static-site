#!/bin/bash
echo "🚀 Deploying S3 CloudFront Secure Static Site..."

terraform init
terraform plan -out=tfplan
terraform apply "tfplan"

echo "✅ Deployment complete."
