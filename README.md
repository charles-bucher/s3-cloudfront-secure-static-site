# Static Website Hosting with AWS S3 and CloudFront

## 🧠 Project Overview
This project demonstrates how to host a static website on AWS S3 and deliver it globally with low latency using AWS CloudFront CDN. It includes setting up the S3 bucket for static hosting, configuring permissions, and creating a CloudFront distribution for caching and SSL.

---

## 🚀 What I Did
- Created an S3 bucket configured for static website hosting  
- Uploaded website files (HTML, CSS, JS) to the S3 bucket  
- Configured bucket policies and permissions for public read access  
- Set up an AWS CloudFront distribution pointing to the S3 bucket  
- Configured SSL certificate with AWS Certificate Manager for HTTPS  
- Tested website availability and performance globally  
- Documented the setup steps and troubleshooting tips

---

## 📁 Project Structure

static-s3-with-cloud-front/
├── README.md
├── website/
│ ├── index.html
│ ├── styles.css
│ └── script.js
├── cloudfront-setup/
│ └── cloudfront-configuration.json
├── screenshots/
│ ├── s3-bucket-setup.png
│ ├── cloudfront-distribution.png
│ └── website-live.png
└── notes/
└── troubleshooting.md

pgsql
Copy
Edit
