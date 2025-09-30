
🔒 S3 + CloudFront Secure Static Site
  
TL;DR This repo deploys a secure, cost‑efficient static website using Amazon S3 and CloudFront with HTTPS and no public S3 access. It’s built to demonstrate a production‑ready setup and my AWS skills. Ideal for portfolios, landing pages, or scalable static sites.
✅ Private S3 bucket
✅ CloudFront CDN with HTTPS
✅ SSL via ACM
✅ IAM least privilege
✅ Route 53 (optional) for custom domain

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
Im a Cloud Support Enthusiast building secure, scalable AWS solutions. This project is part of my cert-aligned portfolio showcasing real-world infrastructure and delivery.

🔗 Related Repos
- aws-ec2-s3-cloudwatch-infra — EC2 Monitoring & Logging
- aws-monitoring-support-lab — CloudWatch + SNS Proactive Alerts

## ?? Repo Hygiene Summary
- Cleaned artifacts and renamed files for recruiter polish.

