# Secure Static Site on AWS S3 + CloudFront

![AWS Certified](https://img.shields.io/badge/AWS-Certified-brightgreen)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-Configured-blue)
![Last Updated](https://img.shields.io/badge/Last%20Updated-2025--09--22-orange)

---

## 📌 Project Purpose & Use Case
This project demonstrates a **secure, scalable, and highly available hosting solution for static websites** using AWS S3 and CloudFront. It is designed for scenarios where static content must be served globally, with **HTTPS enforced** and **strict security controls** in place.

**Use Cases:**
- Hosting marketing landing pages
- Serving static assets for web applications
- Learning IaC (Infrastructure as Code) and AWS security best practices

---

## 🏗 Architecture Overview

![Architecture Diagram](./architecture-diagram.png)

**Key Components:**
- **S3 Bucket**: Stores static site files with **public access blocked**
- **CloudFront Distribution**: Only accesses S3 via **Origin Access Control (OAC)**, enforces HTTPS
- **IAM Policies**: Least-privilege access to deploy static content
- **Optional:** Terraform module for S3 + CloudFront provisioning (coming soon)

---

## ⚙️ Deployment Guide (Step-by-Step)

1. **Prepare your AWS account**  
   Ensure you have proper IAM permissions to create S3 buckets, CloudFront distributions, and ACM certificates.

2. **Upload static site files**  
   ```bash
   aws s3 sync ./site s3://your-bucket-name --delete
Configure S3 bucket policy
Use the provided bucket-policy.json to restrict public access and allow CloudFront only:

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

Enable default caching and compression

Deploy
Once the bucket policy and CloudFront distribution are in place, the site is live at the CloudFront URL.

🔒 Security Best Practices Implemented
 S3 public access blocked

 CloudFront-only access via Origin Access Control (OAC)

 HTTPS enforced via ACM certificate

 IAM policies scoped to least privilege

 Automated security checks (e.g., tfsec, checkov)

🗂 Code & Configuration
 Static site files: index.html, style.css

 Bucket policy JSON

 CloudFront configuration notes

 Terraform or CloudFormation templates (coming soon)

 Modular structure for reuse (modules/cloudfront, modules/s3)

 CI/CD pipeline (GitHub Actions or shell script)

📊 Visuals
 Architecture diagram

 Annotated diagram with traffic flow

 Screenshots of deployed site or AWS console

🚀 Live Demo
Pending deployment

💼 Recruiter Appeal
 Pinned project on GitHub profile

 Linked in your GitHub Pages portfolio

 README intro tailored to hiring managers:

"This project demonstrates secure, scalable AWS hosting for static sites using IaC and CDN optimization."

🔧 Suggested Additions
Terraform Module: Even a basic one for S3 + CloudFront + ACM will show off IaC chops.

CI/CD: Simple GitHub Actions workflow to sync site folder to S3 on push.

README Polish: Add badges, visuals, and a “Why this matters” section for recruiters.

Live Demo URL: Deploy CloudFront distribution and show screenshot or link.





