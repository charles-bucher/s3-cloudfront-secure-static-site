🌐 Static Website Hosting with Amazon S3 + CloudFront
Designed & Documented by Charles — Your Friendly Aspiring Cloud Engineer

🧠 Scenario: Why This Project?
Imagine you’re launching your personal portfolio site — you want it blazing fast no matter where your visitors are in the world. But you’re also serious about security: your S3 bucket should be locked down tight, only letting trusted services peek inside. Plus, every update should be smooth and automated — no painful clicking around the AWS console.

This project shows you how to build exactly that — a secure, lightning-fast static website hosted on S3 and delivered globally via CloudFront — following AWS best practices. Perfect for portfolios, landing pages, or any lightweight site you want to scale with confidence.

⚙️ Architecture Summary
Component	What It Does
🪣 S3 Bucket	Holds your static website files (HTML, CSS, JS, images) — fully private
🌍 CloudFront CDN	Delivers your site fast from edge locations all over the globe
🔐 Origin Access Control (OAC)	Locks down the S3 bucket so only CloudFront can read the files
✅ HTTPS	Ensures all traffic is encrypted between visitors and CloudFront

🖼️ Architecture Diagram (Mermaid)
mermaid
Copy code
flowchart LR
    Visitors[🌎 End Users] <-->|HTTPS| CloudFront[🚀 CloudFront CDN]
    CloudFront -->|Origin Access Control (OAC)| S3[🔒 Private S3 Bucket (Static Site Files)]
🔧 How It Works
1. Amazon S3
Hosts your entire static site with website hosting enabled

Bucket blocks all public internet access — nobody can bypass CloudFront

You upload or automate deployment of your site files (HTML, CSS, images) to S3

2. Amazon CloudFront
Speeds up delivery by caching your content at AWS edge locations worldwide

Forces HTTPS connections for security and trust

Uses Origin Access Control (OAC) to securely fetch content from your private S3 bucket

Supports custom domains and SSL certificates if you want your own branded URL

🔐 Security Highlights
No public access to your S3 bucket — it’s locked down tight

Only CloudFront can read from your S3 bucket via OAC, so your origin stays invisible

End-to-end HTTPS encryption protects your visitors and your content

Bucket policies and CloudFront settings work hand-in-hand for multi-layer security
