## TL;DR
A production-style **secure static website** hosted on **Amazon S3** and distributed via **CloudFront** with HTTPS and custom domain support.  
Infrastructure is provisioned with **Terraform**, following security best practices like least-privilege IAM and bucket policies.  

**Tech Stack:** Terraform · AWS S3 · CloudFront · ACM (SSL) · IAM  
**Skills Demonstrated:** Infrastructure as Code (IaC), Cloud security, CDN optimization, cost awareness, and scalable static web hosting  

---

## Features
- **Secure Hosting:** S3 bucket configured for static website hosting with private access only through CloudFront.  
- **Global Distribution:** CloudFront CDN delivers cached content with low latency worldwide.  
- **TLS/HTTPS:** Enforced HTTPS using AWS Certificate Manager.  
- **IAM Best Practices:** Least-privilege roles and policies defined in Terraform.  
- **IaC Workflow:** Modular Terraform configuration for repeatable deployments.  

## Cost Considerations
- S3 and CloudFront both offer free tiers, but usage beyond ~50GB/month or many requests can incur charges.  
- TLS certificates from ACM are free.  
- Always review and destroy resources after testing to avoid unnecessary costs.


🌐 Use Case: My Portfolio Launch  
I built this to host my own portfolio the right way — cheap, secure, and fast.  
What I needed:  
⚡ Global delivery with low latency  
🔒 HTTPS-only access (no sloppy redirects)  
☁️ Static hosting at near-zero cost  
🚫 S3 locked down — no public access  
🧠 Real-world setup that shows I can design production-ready infra  
This repo makes that happen.


🧱 Architecture Overview
|  |  | 
|  |  | 
|  |  | 
|  |  | 
|  |  | 
|  |  | 


📌 All traffic flows through CloudFront. S3 is private and only accessible via signed origin requests.

🛠️ Deployment Steps
1. S3 Bucket
- Create bucket
- Block public access
- Enable static hosting
- Upload files
- Apply bucket policy (CloudFront-only access)
2. ACM
- Request public SSL cert
- Validate via Route 53 or DNS
3. CloudFront
- Create distribution
- Use Origin Access Control (OAC)
- Attach ACM cert for HTTPS
4. Route 53 (Optional)
- Point domain to CloudFront via A/AAAA records
5. Test
- ✅ HTTPS works
- ✅ Direct S3 access blocked (403)

📁 File Tree
.
├── site/                  # Static website files
│   ├── index.html
│   └── style.css
├── policies/              # Bucket & IAM policies
├── cloudformation/        # Infra-as-Code (optional)
├── architecture-diagram.png
└── README.md



🔐 Security Checklist
- ✅ S3 bucket: Block public access
- ✅ CloudFront-only access to S3
- ✅ HTTPS enforced end-to-end
- ✅ IAM: Least privilege, no wildcards
- ✅ No open permissions

💸 Cost Estimate (Low-Traffic Site)
|  |  | 
|  |  | 
|  |  | 
|  |  | 
|  |  | 


Static site hosting on AWS (built for my portfolio)

CDN caching via CloudFront for low latency

SSL & DNS integration with ACM and Route 53

IAM & S3 bucket policy setup for strong security

Real‑world infrastructure I can point to in interviews



🧭 Cert Mapping
|  |  | 
|  |  | 
|  |  | 
|  |  | 
|  |  | 



🧑‍💻 About Me
I'm Charles Bucher, a Cloud Infrastructure Engineer building secure, scalable AWS solutions. I focus on Infrastructure-as-Code with Terraform, automated deployments, and security-first architecture.

🔗 Related Repos
- aws-ec2-s3-cloudwatch-infra — EC2 Monitoring & Logging
- aws-monitoring-support-lab — CloudWatch + SNS Proactive Alerts

## ?? Repo Hygiene Summary
- Cleaned artifacts and renamed files for recruiter polish.


<!-- Badges -->
![Cert Alignment](https://img.shields.io/badge/cert-AWS-blue)
![Repo Type](https://img.shields.io/badge/type-Infrastructure-green)
![Last Updated](https://img.shields.io/badge/updated-2025--09--30-orange)


## Badges
[![AWS Certified](https://img.shields.io/badge/AWS-Certified-blue)](https://aws.amazon.com/certification/)

## Certification Mapping
This repo aligns with AWS Solutions Architect and Cloud Practitioner domains.
