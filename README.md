# 🔐 Secure Static Site on AWS S3 + CloudFront

![AWS Certified](https://img.shields.io/badge/AWS-Certified-brightgreen)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-Configured-blue)
![Last Updated](https://img.shields.io/badge/Last%20Updated-2025--09--22-orange)

---

## 📌 Project Purpose & Use Case
This project demonstrates **secure, scalable static website hosting** on AWS using **S3 and CloudFront**, with enterprise-level security controls.  

**Use Cases:**  
- Hosting portfolio or marketing landing pages  
- Serving global static content with low latency  
- Learning IaC, AWS security best practices, and CDN optimization  

---

## 🏗 Architecture Overview

![Architecture Diagram](./architecture-diagram.png)

**Components:**  
- **S3 Bucket**: Stores static site files, **public access blocked**  
- **CloudFront Distribution**: Accesses S3 via **Origin Access Control (OAC)**, enforces HTTPS  
- **IAM Policies**: Least-privilege access to deploy content  
- **Terraform Module**: Placeholder for automated deployment (coming soon)  

---

## ⚙️ Deployment Guide

1. **Prepare AWS account**  
   Ensure you have IAM permissions for S3, CloudFront, and ACM certificates.

2. **Upload static site files**  
   ```bash
   aws s3 sync ./site s3://your-bucket-name --delete
Set S3 bucket policy
Restrict public access and allow CloudFront only:

json
Copy code
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::your-bucket-name/*"
        }
    ]
}
Configure CloudFront

Enable OAC to access S3

Enforce HTTPS-only traffic

Enable caching and compression

Deploy & Verify
Once configured, your site is live at the CloudFront URL.

🔒 Security Best Practices
 S3 public access blocked

 CloudFront-only access via Origin Access Control (OAC)

 HTTPS enforced via ACM certificate

 IAM policies scoped to least privilege

 Automated security checks (tfsec, checkov)

🗂 Code & Configuration
 Static site files (index.html, style.css)

 Bucket policy JSON

 CloudFront configuration notes

 Terraform or CloudFormation templates (placeholder)

 Modular structure for reuse (modules/cloudfront, modules/s3)

 CI/CD pipeline (GitHub Actions placeholder)

🌐 Live Demo
Pending deployment — will update with CloudFront URL or GitHub Pages link

💼 Recruiter Appeal
 Pinned project on GitHub profile

 Linked in GitHub Pages portfolio

 README intro tailored to hiring managers:

“This project demonstrates secure, scalable AWS hosting for static sites using IaC and CDN optimization.”

🔧 Suggested Additions
Terraform Module: Basic S3 + CloudFront + ACM automation.

CI/CD: GitHub Actions workflow to sync site/ to S3 on push.

Live Demo Screenshot: Include once deployed.

Badges & Visuals: Show AWS skills and project status.
