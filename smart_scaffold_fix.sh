#!/bin/bash

echo "Alright — let’s get this S3-CloudFront-Secure-Static-Site repo looking sharp."

# Step 1 — Make folder structure only if missing
[ ! -d "terraform/modules" ] && mkdir -p terraform/modules
[ ! -d "terraform/environments/dev" ] && mkdir -p terraform/environments/dev
[ ! -d "docs/architecture" ] && mkdir -p docs/architecture
[ ! -d "scripts" ] && mkdir -p scripts

echo "✅ Folder structure checked/created."

# Step 2 — README scaffold (overwrite)
cat > README.md <<EOL
# S3 CloudFront Secure Static Site

## Why this matters
This isn’t just a static site — it’s a fully locked-down, secure hosting solution that proves I know AWS and cloud security inside and out.

## Architecture
📌 Diagram: docs/architecture/architecture.png  
Shows S3 bucket, CloudFront distribution, IAM policies.

## What it does
- Lock down S3 bucket so no one accesses it directly
- Deliver content fast with CloudFront
- Add security headers
- Automate deployment

## How to run
1. Clone this repo
2. Run \`./scripts/deploy.sh\`
3. Check the live site

## Security
IAM least privilege, HTTPS only, no hard-coded credentials.

## Cost efficiency
CloudFront caching + S3 lifecycle policies.

— Built by Charles.

EOL
echo "📄 README scaffold dropped in."

# Step 3 — Deployment script scaffold
cat > scripts/deploy.sh <<EOL
#!/bin/bash
echo "🚀 Deploying S3 CloudFront Secure Static Site..."

terraform init
terraform plan -out=tfplan
terraform apply "tfplan"

echo "✅ Deployment complete."
EOL
chmod +x scripts/deploy.sh
echo "🛠 Deployment script ready."

# Step 4 — GitHub Actions scaffold
[ ! -d ".github/workflows" ] && mkdir -p .github/workflows
cat > .github/workflows/deploy.yml <<EOL
name: Deploy S3 Static Site

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v2
      - name: Terraform Init
        run: terraform init
      - name: Terraform Plan
        run: terraform plan -out=tfplan
      - name: Terraform Apply
        run: terraform apply -auto-approve tfplan
EOL

echo "🎯 GitHub Actions scaffold created."
echo "All done — repo scaffold fixed and safe."
