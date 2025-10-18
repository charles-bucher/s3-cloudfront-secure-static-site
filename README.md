
=======
☁️ S3 + CloudFront Secure Static Site Hosting


> 🚀 Deploy a secure, global static website using AWS S3 + CloudFront with Terraform. This repo demonstrates cert-aligned architecture, IAM hardening, CDN optimization, and cost-efficient design—perfect for marketing sites, dashboards, and SPAs.☁️ S3 + CloudFront | 🔐 Secure | 🚀 Fast | 💰 Cost-Efficient | 🧱 Terraform | 


![IAM Deployment](screenshots/IAM_Deploy_screenshot.png)
![S3 Creation](screenshots/s3_creation_screenshot.png)



## 🛡️ Cert Alignment + Badges

| AWS Service     | Cert Domain            | Badge |
|-----------------|------------------------|-------|
| S3 + CloudFront | Solutions Architect    | ![SAA](https://img.shields.io/badge/SAA-S3%2FCloudFront-blue) |
| IAM             | Security Specialty     | ![Security](https://img.shields.io/badge/Security-IAM%2FOAI-red) |
| Terraform       | Infrastructure as Code | ![IaC](https://img.shields.io/badge/Terraform-Modular%20IaC-purple) |


+🖼️ Diagrammed
High-Performance, Globally-Distributed Web Hosting with AWS
Show Image
Show Image
Show Image
Show Image
</div>


🎯 PROJECT OVERVIEW
This project demonstrates a production-ready static website hosting solution using AWS S3 and CloudFront CDN. It's not just a basic S3 bucket—it's a fully secure, performant, and cost-optimized architecture following AWS best practices.
Why This Matters
Static site hosting seems simple, but doing it right requires:

✅ Security hardening (no public buckets, proper IAM)
✅ Global performance (CDN edge caching)
✅ SSL/TLS encryption (ACM certificates)
✅ Cost optimization (S3 storage classes, CloudFront caching)
✅ Infrastructure as Code (repeatable, version-controlled)

This project proves I understand the difference between "making it work" and "making it production-ready."

🏗️ ARCHITECTURE
┌─────────────┐
│   Route 53  │  ← Custom domain with DNS routing
└──────┬──────┘
       │
       ▼
┌─────────────────────────────────────────────┐
│          CloudFront Distribution             │
│  • Global edge locations (low latency)      │
│  • SSL/TLS termination (ACM certificate)    │
│  • HTTPS enforcement                         │
│  • Cache optimization (TTLs configured)     │
│  • Origin Access Identity (OAI)             │
└──────────────────┬──────────────────────────┘
                   │
                   ▼
         ┌─────────────────┐
         │   S3 Bucket      │
         │  • Private       │
         │  • Encrypted     │
         │  • Versioning    │
         │  • Access Logs   │
         └─────────────────┘

## Screenshots

### IAM Deployment
![IAM Deployment](screenshots/IAM\ Deploy\ screenshot.png)

### S3 Creation
![S3 Creation](screenshots/s3\ creation\ screenshot.png)






🔥 KEY FEATURES
🔐 Security First

Private S3 bucket - No public access, all requests through CloudFront
Origin Access Identity (OAI) - CloudFront has exclusive S3 access
SSL/TLS encryption - ACM certificate for HTTPS
Bucket encryption - Server-side encryption at rest
Access logging - All requests logged for security auditing

⚡ Performance Optimized

Global CDN - CloudFront edge locations worldwide (sub-100ms latency)
Smart caching - Configurable TTLs based on content type
Gzip compression - Automatic compression for faster transfers
HTTP/2 support - Modern protocol for multiplexing

💰 Cost Efficient

S3 storage classes - Intelligent tiering for infrequent access
CloudFront pricing - Pay only for data transfer
No EC2 costs - Serverless architecture
Cache hit optimization - Reduced origin requests = lower costs

🛠️ Infrastructure as Code

Terraform managed - All resources version-controlled
Repeatable deployments - Spin up identical environments
State management - Remote state for team collaboration
Modular design - Reusable components


🚀 WHAT I LEARNED
Building this project taught me:

CloudFront is more than a CDN - It's a security layer, performance optimizer, and cost reducer
S3 bucket policies are critical - One misconfiguration = entire bucket exposed
OAI vs Bucket Policies - When to use each for access control
Certificate validation - ACM DNS validation vs email validation
Cache invalidation costs money - Design your cache strategy carefully
Terraform state files contain secrets - Always use remote state with encryption


📋 TECHNICAL IMPLEMENTATION
Tech Stack

AWS S3 - Object storage for static assets
AWS CloudFront - Global CDN distribution
AWS Route 53 - DNS management
AWS ACM - SSL/TLS certificate management
Terraform - Infrastructure as Code
AWS IAM - Access policies and OAI

Key Components
S3 Bucket Configuration
hcl- Bucket versioning enabled
- Server-side encryption (AES-256)
- Public access blocked at all levels
- Access logging to separate bucket
- Lifecycle policies for cost optimization
CloudFront Distribution
hcl- Origin: S3 bucket via OAI
- Viewer protocol: Redirect HTTP to HTTPS
- Allowed methods: GET, HEAD, OPTIONS
- Compress objects automatically
- Custom error responses (404, 403)
- Price class: Use only North America and Europe
Security Policies
hcl- S3 bucket policy: Deny all except OAI
- CloudFront OAI with read-only access
- ACM certificate with automatic renewal
- Security headers (HSTS, X-Frame-Options)

💼 REAL-WORLD USE CASES
This architecture is perfect for:

📄 Marketing websites and landing pages
📊 Data visualization dashboards
📚 Documentation sites
🎨 Portfolio websites
📱 Single-page applications (SPAs)
🏢 Corporate websites with global traffic


🎓 SKILLS DEMONSTRATED
✅ AWS Services Integration - S3, CloudFront, Route 53, ACM, IAM
✅ Security Best Practices - Least privilege, encryption, private buckets
✅ Infrastructure as Code - Terraform for repeatable deployments
✅ Cost Optimization - Serverless, cache strategy, storage classes
✅ Performance Engineering - Global CDN, compression, HTTP/2
✅ Documentation - Clear architecture diagrams and explanations

🔗 RELATED PROJECTS
Check out my other AWS infrastructure projects:

🏗️ Multi-Tier VPC Architecture - Production network design
📊 CloudWatch Proactive Monitoring - Infrastructure observability
🔐 GuardDuty Threat Response - Automated security


📫 CONNECT WITH ME             
https://github.com/charles-bucher

<div align="center">
⚡ Building production-grade infrastructure, one project at a time.
Show Image
</div>
>>>>>>> eb59d3141ca4fea0f1dfc37756adec5f37bb66e7
