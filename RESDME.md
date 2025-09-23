🔐 Secure Static Site on AWS S3 + CloudFront






📌 Project Purpose & Use Case

This project demonstrates secure, scalable static website hosting on AWS using S3 and CloudFront, with enterprise-level security controls.

Use Cases:

Hosting portfolio or marketing landing pages

Serving global static content with low latency

Learning IaC, AWS security best practices, and CDN optimization

🏗 Architecture Overview
flowchart LR
    User -->|HTTPS| CloudFront[CloudFront CDN]
    CloudFront -->|Signed (OAC)| S3[S3 Bucket (private)]
    CloudFront --> ACM[ACM Certificate (us-east-1)]


Components:

S3 Bucket: Stores static site files, public access blocked

CloudFront Distribution: Accesses S3 via Origin Access Control (OAC), enforces HTTPS

IAM Policies: Least-privilege access to deploy content

Terraform Module: Automates deployment (see modules/s3-cloudfront-site)

⚙️ Deployment Guide

Prepare AWS Account
Ensure IAM permissions for S3, CloudFront, and ACM certificates.

Upload static site files

aws s3 sync ./site s3://your-bucket-name --delete


Set S3 bucket policy
Block public access and allow CloudFront only:

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

Enable Origin Access Control (OAC) to access S3

Enforce HTTPS-only traffic

Enable caching and compression

Deploy & Verify
Access your site at the CloudFront domain output by Terraform:
https://<cloudfront-domain>.cloudfront.net

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

Terraform module: modules/s3-cloudfront-site

Modular structure for reuse (e.g., modules/cloudfront, modules/s3)

CI/CD pipeline via GitHub Actions

🌐 Live Demo

Pending deployment — will update with CloudFront URL once live.
