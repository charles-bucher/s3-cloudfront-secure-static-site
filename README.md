Static Website Hosting with AWS S3 & CloudFront
This project demonstrates how to deploy a fully functional, scalable static website using Amazon S3 for storage and Amazon CloudFront as a global Content Delivery Network (CDN) to optimize site performance, availability, and security.

🚀 Project Overview
Host a static website (HTML/CSS/JS) with Amazon S3 as the origin storage.

Serve the website globally with low latency using CloudFront CDN.

Configure HTTPS with CloudFront (optional).

Manage all infrastructure with Infrastructure as Code (IaC) using Terraform.

Automate deployment with Bash scripts (optional).

🧰 Tech Stack
AWS S3 – Durable, scalable static file storage.

AWS CloudFront – CDN for fast content delivery worldwide.

Terraform – IaC tool to provision S3 bucket, CloudFront distribution, and IAM policies.

Bash Scripts – Automate deployment and syncing of website files.

GitHub – Source control and version history.

📁 Repository Structure
php
Copy
Edit
static-s3-with-cloud-front/
│
├── terraform/                 # Terraform configs for AWS infra
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
│
├── website/                   # Static website source files
│   ├── index.html
│   ├── styles.css
│   └── assets/
│       └── images/
│
├── scripts/                   # Deployment automation scripts
│   └── deploy.sh
│
└── README.md                  # Project overview and instructions
⚙️ How to Deploy
Prerequisites
AWS CLI configured with proper credentials

Terraform installed

Access to an AWS account with permissions to create S3 buckets and CloudFront distributions

Deployment Steps
Initialize Terraform

bash
Copy
Edit
cd terraform
terraform init
Plan & Apply Infrastructure

bash
Copy
Edit
terraform plan
terraform apply
Deploy Static Website

Use the deployment script to sync your local website files to the S3 bucket:

bash
Copy
Edit
bash ../scripts/deploy.sh
Access Your Website

After deployment, find the CloudFront domain name in Terraform outputs or AWS Console and open it in your browser.

🔐 Security & Best Practices
S3 bucket configured for public read only on website files.

CloudFront used to distribute content securely over HTTPS.

IAM policies scoped with least privilege.

Terraform used for repeatable, version-controlled infrastructure.

🚀 Future Improvements
Add Route53 DNS integration for a custom domain.

Automate TLS certificates with AWS Certificate Manager.

Add CI/CD pipeline with GitHub Actions.

Optimize website for SEO and accessibility.

👤 About Me
Charles T Bucher (Tommy813)
Junior Cloud Engineer | Infrastructure Automation Enthusiast

