# Static Website Hosting on AWS S3 with CloudFront CDN

[![AWS](https://img.shields.io/badge/AWS-Cloud-232F3E?style=flat&logo=amazonaws)](https://aws.amazon.com)  
[![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub%20Actions-2088FF?style=flat&logo=github)](https://github.com/features/actions)  

---

## Overview

This project demonstrates hosting a **static single-page application (SPA)** on **AWS S3** with a **CloudFront CDN** distribution for fast, secure, global delivery. The deployment pipeline is fully automated using **GitHub Actions** with cache invalidation.

Key features include:

- Static website hosting on S3 with public read access  
- CloudFront CDN with HTTPS and caching  
- SPA routing support via CloudFront custom error responses  
- Automated CI/CD with GitHub Actions  
- Cache invalidation to ensure fresh content delivery  
- Basic security headers configured via CloudFront response policies  

---

## Architecture Diagram

![Architecture Diagram](./docs/aws-architecture-diagram.png)

---

## Folder Structure

.github/workflows/ # GitHub Actions workflows for CI/CD
src/ # Static website files to deploy
docs/ # Documentation and diagrams
README.md # This file

yaml
Copy code

---

## Prerequisites

- AWS account with permissions to create S3, CloudFront, IAM roles  
- GitHub repository with Actions enabled  
- (Optional) Custom domain and SSL certificates via AWS ACM  

---

## Setup and Deployment

### 1. Configure AWS Resources Manually (Optional)

- Create an S3 bucket configured for static website hosting.  
- Create a CloudFront distribution with:  
  - Origin set to S3 static website endpoint  
  - Default root object: `index.html`  
  - Custom error responses for 403 and 404 to `index.html` (SPA routing)  
  - Response headers policy for security headers  
- Configure your domain and SSL certs (if applicable).

> Alternatively, automate all infra provisioning with Terraform using the provided scripts in the `terraform/` folder.

### 2. Configure GitHub Secrets

Add the following secrets to your GitHub repository settings:

| Secret Name        | Description                         |
|--------------------|-----------------------------------|
| `AWS_ROLE_TO_ASSUME`| ARN of IAM role with deploy rights |
| `AWS_REGION`       | AWS region (e.g., us-east-1)      |

### 3. Deploy via GitHub Actions

- Push your changes to the `main` branch.  
- The workflow defined in `.github/workflows/deploy.yml` will:  
  - Sync your static files from `src/` to the S3 bucket  
  - Invalidate CloudFront cache to update content globally  

---

## SPA Routing Support

CloudFront is configured to redirect 403 and 404 errors to `index.html`. This allows client-side routing frameworks (React Router, Vue Router, etc.) to work properly by always serving the SPA entry point.

---

## Security Headers

The CloudFront distribution applies HTTP security headers including:

- Strict-Transport-Security (HSTS)  
- Content-Security-Policy (CSP)  
- X-Frame-Options  
- X-Content-Type-Options  
- Referrer-Policy  

These improve security by enforcing HTTPS, preventing clickjacking, and controlling content loading policies.

---

## Cache Invalidation

After each deployment, CloudFront caches are invalidated automatically to ensure visitors get the latest version of your site without stale content delays.

---

## Future Improvements

- Full Infrastructure as Code (IaC) with Terraform for provisioning S3, CloudFront, ACM, and Route53.  
- Add staging and production environments.  
- Integrate automated testing and linting in the CI pipeline.  
- Add monitoring and alerting for CloudFront and S3 using AWS CloudWatch.  

---

## About Me

I’m Tommy, a Junior Cloud Engineer building real-world AWS infrastructure and CI/CD pipelines. This project demonstrates my ability to automate cloud deployments and manage secure, scalable static website hosting.

---

## License

MIT License © 2025 Tommy

---

## Questions or Feedback?

Feel free to open an issue or contact me via GitHub discussions. I’m eager to improve this project and collaborate.

---











