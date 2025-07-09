🌐 Static Website Hosting with Amazon S3 + CloudFront
Built & Documented by Charles — Aspiring Cloud Engineer

🧠 Overview
This project shows how to build and deploy a secure, high-performance static website using Amazon S3 and CloudFront, following AWS best practices.

Ideal for portfolios, landing pages, and lightweight websites.

⚙️ Architecture Summary
Component	Purpose
🪣 S3 Bucket	Stores HTML, CSS, JS, images
🌍 CloudFront CDN	Global content delivery network for speed
🔐 Origin Access Control (OAC)	Restricts S3 access only to CloudFront
✅ HTTPS	Enforces encrypted traffic between edge and users

🖼️ Architecture Diagram
sql
Copy code
+--------------------+      +-----------------------+
|                    |      |                       |
|     End Users      <----->|   CloudFront CDN       |
|  (Global Visitors) | HTTPS|  (Edge Locations)     |
|                    |      |                       |
+--------------------+      +-----------+-----------+
                                       |
                       Origin Access Control (OAC)
                                       |
                               +-------v--------+
                               | Private S3      |
                               | Bucket (Static  |
                               | Website Files)  |
                               +----------------+
🔧 How It Works
Amazon S3

Hosts static files with static website hosting enabled

Public access blocked to keep files secure

Files deployed automatically with GitHub Actions

Amazon CloudFront

Distributes content globally for low latency

Enforces HTTPS for secure connections

Uses Origin Access Control (OAC) so only CloudFront can read from the private S3 bucket

Supports custom domain names (optional)

🔐 Security Highlights
S3 bucket access limited strictly to CloudFront via Origin Access Control (OAC)

HTTPS enforced at CloudFront edge locations

Bucket policies + CloudFront settings combine for strong protection
