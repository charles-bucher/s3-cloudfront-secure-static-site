☁️ Secure Static Website Infrastructure — AWS S3 + CloudFront
Overview
This repository contains a production-grade static website deployment designed for high availability, low latency, and strong security posture using AWS S3 and CloudFront.
It demonstrates how to deliver global, scalable content without provisioning or maintaining servers, following AWS Well-Architected Framework principles.

🔧 Core Objectives
Deploy a static web application using an S3 origin with CloudFront for content distribution.

Enforce encryption, least-privilege access, and end-to-end observability.

Automate provisioning with Terraform, enabling repeatable and auditable infrastructure builds.

🧠 Architecture Summary
CloudFront distributes content from a private S3 bucket using an Origin Access Control (OAC).
Requests are validated via IAM roles and service-linked policies.
All data is encrypted at rest (SSE-S3, AES-256) and in transit (TLS 1.2+).
CloudWatch captures performance metrics, while CloudTrail logs API activity for compliance tracking.

Client → CloudFront CDN → S3 (Private Bucket)
                      ↘  CloudWatch / CloudTrail
🔐 Security Highlights
Control	Implementation	Level
IAM Access	Role-based with least-privilege policies	🔒 High
Data Encryption	AES-256 (at rest), TLS 1.2+ (in transit)	🔒 High
Access Control	OAC + Bucket policies blocking public access	🔒 High
Audit Logging	CloudTrail events, S3 access logs	🔒 Critical
MFA / Key Rotation	Enforced for privileged users	🔒 High
🧱 Stack
AWS Services: S3, CloudFront, IAM, KMS, CloudWatch, CloudTrail

IaC: Terraform (modularized for S3, CloudFront, IAM)

Languages / SDKs: HCL, Python (boto3), Bash

Security Tooling: AWS Config, IAM Analyzer, least-privilege policy simulation

🚀 Quick Start
# Clone repository
git clone https://github.com/charles-bucher/s3-cloudfront-secure-static-site.git
cd s3-cloudfront-secure-static-site

# Deploy Terraform modules
terraform init
terraform apply -auto-approve
Terraform automatically provisions all required IAM roles, bucket policies, and CloudFront distribution.

📊 Monitoring & Compliance
CloudWatch dashboards track request latency and origin errors.

S3 Access Logs stored in a dedicated log bucket for forensic review.

CloudTrail logs management events for continuous auditing.

Integrations ready for Grafana / Security Hub for advanced visibility.

💡 Design Principles
Infrastructure as Code — consistent, repeatable environments

Defense in Depth — multiple overlapping security controls

Cost Awareness — optimized storage classes and caching policies

Operational Excellence — automated validation, minimal manual steps

📚 Relevant Domains
This project demonstrates technical depth across:

Cloud Engineering — distributed storage, CDN configuration, IaC pipelines

Cloud Security — IAM design, KMS integration, audit trails

DevOps Automation — CI/CD-ready Terraform workflow

Monitoring & FinOps — metrics, logs, and cost optimization

🧭 Roadmap
Lambda@Edge for dynamic request filtering

CloudFront geo-restriction policies

Cross-region replication with versioning

Automated compliance scanning (SOC2 / ISO 27001 baselines)

Custom dashboard integration with Grafana

🧑‍💻 Author
Charles Bucher
Cloud Engineer
Building secure, scalable systems with AWS and Terraform.


