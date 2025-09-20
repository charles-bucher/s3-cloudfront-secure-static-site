📦 Secure Static Website with S3 + CloudFront + SSL
Deploy blazing-fast, globally distributed static websites with AWS S3, CloudFront, and HTTPS. Lock it down tight with security-first policies and custom domain support.


🔥 Real-World Scenario: Charles' Portfolio Launch
You're Charles, a Cloud Support Engineer launching a sleek, secure personal portfolio. You want:

⚡ Global delivery with low latency

🔐 HTTPS-only access (no sketchy redirects)

☁️ Static hosting at near-zero cost

🚫 S3 locked down—no public access

🧠 A real-world setup that impresses recruiters and hiring managers

This repo walks through that setup with production-level quality.

⚙️ Architecture Overview
🔹 Key AWS Services:
Service	Purpose
S3	Static file hosting (HTML, CSS, JS, assets)
CloudFront	CDN to cache and distribute globally
ACM	Free HTTPS certificates via AWS
Route 53	(Optional) Domain name routing
IAM	Secure permissions & roles

📊 Diagram Overview
scss
Copy
Edit
User → CloudFront (HTTPS) → S3 (Private Bucket)
               ↓
         [ACM Certificate]
               ↓
     [Route 53 DNS Routing]
All requests go through CloudFront. S3 is private and only accessible via a signed origin.

🚀 Deployment Guide
✅ Step-by-Step
S3: Create Bucket

Disable public access

Enable static site hosting

Upload your files

Bucket Policy

json
Copy
Edit
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowCloudFrontOnly",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::your-bucket-name/*",
      "Condition": {
        "StringNotEquals": {
          "aws:SourceArn": "arn:aws:cloudfront::<your-cloudfront-distribution-id>"
        }
      }
    }
  ]
}
ACM: Create SSL Cert

Request a public cert (e.g., www.charlescloud.dev)

Validate via Route 53 or your DNS provider

CloudFront

Create distribution with S3 as origin

Use OAC (Origin Access Control) to restrict access

Attach ACM cert for HTTPS

Route 53 (Optional)

Create A/AAAA records pointing to CloudFront

Test

Visit your domain with HTTPS

Block direct S3 URL access (403 expected)

📁 File Tree Example
bash
Copy
Edit
.
├── site/                        # Your static website files
│   ├── index.html
│   └── style.css
├── policies/                    # JSON bucket & IAM policies
├── cloudformation/             # Infra-as-Code (optional)
├── architecture-diagram.png    # Visual architecture
└── README.md
🔐 Security Checklist
✅ S3 Bucket Block Public Access
✅ CloudFront-only access to S3
✅ HTTPS enforced end-to-end
✅ No open permissions or wildcards
✅ IAM policies scoped to least privilege

💰 Cost Estimate (Low-Traffic Personal Site)
Service	Monthly Cost Estimate
S3	~$0.50 (storage & requests)
CloudFront	~$1.00 (first 1 TB free tier)
ACM	Free
Route 53	$0.50 per hosted zone

🧠 Skills You’ll Demonstrate
Static website hosting on AWS

CDN caching via CloudFront

DNS and SSL integration

IAM & S3 bucket policy mastery

Real-world secure architecture

🧑‍💻 About Me
Charles – Cloud Support Enthusiast building secure, scalable AWS solutions.
This project is part of my cloud engineering portfolio demonstrating best practices in infrastructure and cloud delivery.

📚 Related Repos
aws-ec2-s3-cloudwatch-infra — EC2 Monitoring & Logging

aws-monitoring-support-lab — CloudWatch + SNS Proactive Alerts
