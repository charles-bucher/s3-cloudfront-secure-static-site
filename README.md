 Static Website Hosting on AWS S3 with CloudFront CDN

[![AWS](https://img.shields.io/badge/AWS-Cloud-232F3E?style=flat&logo=amazonaws)](https://aws.amazon.com)  
[![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub%20Actions-2088FF?style=flat&logo=github)](https://github.com/features/actions)  

---

## Overview

This project demonstrates hosting a **static single-page application (SPA)** on **AWS S3** backed by **CloudFront CDN** for global low-latency delivery, HTTPS security, and scalability. It includes automation of deployment using **GitHub Actions** and best practices such as:

- HTTPS with custom domain support  
- Automatic redirects (`www` to apex domain)  
- Cache control and CloudFront cache invalidation  
- SPA-friendly routing (fallback to `index.html`)  
- Security headers to improve site security  
- Least-privilege IAM roles for deployment  

---

## Architecture Diagram

![Architecture Diagram](./docs/aws-architecture-diagram.png)

1. **Source Code & Static Assets** are stored in this repo.  
2. **GitHub Actions** triggers on `main` branch push to:  
   - Build assets (if needed)  
   - Upload to S3 bucket  
   - Invalidate CloudFront cache  
3. **CloudFront** serves content securely worldwide with HTTPS and caching.  
4. **S3 Bucket** hosts the static website with proper bucket policies.

---

## Features

| Feature | Description |
|-|-|
| Static website hosting | S3 bucket configured for static website hosting |
| CDN & HTTPS | CloudFront distribution with SSL certificate via AWS Certificate Manager |
| SPA routing | CloudFront error handling configured to serve `index.html` on 404s |
| GitHub Actions CI/CD | Automated deployment pipeline triggered on push |
| Cache invalidation | CloudFront caches are invalidated automatically after deploy |
| Security headers | HTTP security headers set via CloudFront Response Headers Policies |
| Least privilege IAM | Deployment uses scoped IAM roles via OIDC and GitHub Actions |
| Domain redirects | Redirects from `www` to apex domain (or vice versa) |

---

## Prerequisites

- AWS Account with permissions to create S3, CloudFront, IAM roles  
- Domain managed in Route53 or other DNS (optional)  
- GitHub repository with GitHub Actions enabled  
- AWS CLI configured locally (for manual testing)

---

## Setup & Deployment

### 1. Configure AWS Resources

- Create an S3 bucket configured for static website hosting.  
- Create a CloudFront distribution with:  
  - S3 bucket as origin  
  - Custom error response for 404 pointing to `/index.html` for SPA support  
  - Response Headers Policies for security headers  
- Setup ACM SSL certificate for your domain.  

### 2. Configure GitHub Secrets

Add the following secrets to your GitHub repository:

| Secret Name | Description |
|-------------|-------------|
| `AWS_ACCOUNT_ID` | Your AWS account ID |
| `AWS_REGION` | AWS region for resources (e.g., us-east-1) |
| `AWS_ROLE_TO_ASSUME` | IAM Role ARN with deployment permissions |
| `AWS_WEB_IDENTITY_TOKEN_FILE` | OIDC token file path (automated by Actions) |

### 3. Deployment via GitHub Actions

- Push changes to the `main` branch triggers deployment workflow.  
- The workflow builds your assets (if applicable), syncs to S3, and invalidates CloudFront cache.

---

## CloudFront SPA Routing Configuration

To support client-side routing (React, Angular, Vue), CloudFront is configured to return the `index.html` page for 403/404 errors. This ensures direct navigation to internal routes does not result in a 404 error from CloudFront.

---

## Security Headers Implemented

| Header | Purpose |
|-|-|
| `Strict-Transport-Security` | Enforces HTTPS only |
| `Content-Security-Policy` | Prevents XSS and data injection attacks |
| `X-Frame-Options` | Prevents clickjacking |
| `X-Content-Type-Options` | Stops MIME sniffing |
| `Referrer-Policy` | Controls referrer information sent with requests |

These headers are configured via CloudFront Response Headers Policy for best performance.

---

## Cache Control & Invalidation

Static assets use cache control headers for optimal CDN caching. After each deployment, GitHub Actions invalidates CloudFront cache to ensure users get the latest updates immediately.

---

## Folder Structure

/.github/workflows/ # GitHub Actions CI/CD workflows
/src/ # Source code or static assets
/docs/ # Documentation and architecture diagrams
/README.md # Project overview and instructions

yaml
Copy code

---

## Future Enhancements

- Add Terraform or CloudFormation templates for automated infra provisioning  
- Implement multi-environment deployments (dev/staging/prod)  
- Add integration tests for deployment pipeline  
- Monitor site health with CloudWatch and alerts  

---

## About Me

I’m Tommy, a junior cloud engineer focused on AWS infrastructure automation and DevOps. This project demonstrates my skills in modern cloud hosting, CI/CD pipelines, and security best practices.

---

## License

MIT License © 2025 Tommy

---

## Questions or Feedback?

Open an issue or reach out via GitHub discussions — I’m eager to collaborate and improve this project!

--









