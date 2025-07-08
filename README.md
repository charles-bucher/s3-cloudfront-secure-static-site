🌐 Static Website Hosting with Amazon S3 + CloudFront
Built & Documented by Charles — Aspiring Cloud Engineer

🧠 Overview
This project demonstrates how to build and deploy a secure, high-performance static website using Amazon S3 and CloudFront, following AWS best practices.

Great for: portfolios, landing pages, and lightweight websites.

⚙️ Architecture Summary
Component	Purpose
🪣 S3 Bucket	Stores HTML, CSS, JS, images
🌍 CloudFront	Global content delivery network (CDN)
🔐 Origin Access Control (OAC)	Ensures only CloudFront can access S3 bucket
✅ HTTPS	Enforces encrypted traffic from edge to user

🖼️ Architecture Diagram
plaintext
Copy code
  +--------------------+          +--------------------+
  |                    |          |                    |
  |    End Users       | <------> |   CloudFront CDN   |
  | (Global Visitors)  | HTTPS    | (Edge Locations)   |
  |                    |          |                    |
  +--------------------+          +---------+----------+
                                            |
                                            | Origin Access Control (OAC)
                                            |
                                   +--------v---------+
                                   |                  |
                                   |   Private S3     |
                                   |   Bucket         |
                                   | (Static Website) |
                                   +------------------+
Diagram Explanation:

Users connect securely via HTTPS to CloudFront’s edge locations worldwide.

CloudFront fetches static content ONLY from your private S3 bucket via Origin Access Control (OAC), keeping your bucket locked down from direct internet access.

🔧 How It Works
Amazon S3
Hosts static files with static website hosting enabled

Public access blocked to keep files secure

Files deployed automatically with GitHub Actions

Amazon CloudFront
Distributes content globally for low latency

Enforces HTTPS for security

Uses OAC so only CloudFront can read S3 files

Supports custom domain names (optional)

🔐 Security Highlights
S3 bucket access limited strictly to CloudFront via OAC

HTTPS enforced at CloudFront edge locations

Bucket policies and CloudFront settings combined for strong protection
