 Static Website Hosting with AWS S3 and CloudFront

This project demonstrates how to host a static website on AWS using Amazon S3 for storage and Amazon CloudFront as a global Content Delivery Network (CDN). The setup provides fast, secure, and scalable delivery of static website content worldwide.

---

## Prerequisites

- AWS CLI installed and configured with AWS credentials  
- An active AWS account with permissions to create and manage S3 buckets, CloudFront distributions, and ACM certificates  
- Basic familiarity with AWS services (S3, CloudFront) is helpful but not required  

---

## Project Overview

This repository contains the steps and scripts to:  
1. Create and configure an S3 bucket for static website hosting  
2. Upload website files to the S3 bucket  
3. Set up a CloudFront distribution to serve the website globally with caching and HTTPS support  
4. Manage updates and cache invalidation for content refresh  

---

## Setup Instructions

### 1. Create and Configure the S3 Bucket for Static Website Hosting

```bash
# Create a new S3 bucket (replace your-unique-bucket-name)
aws s3 mb s3://your-unique-bucket-name

# Enable static website hosting on the bucket
aws s3 website s3://your-unique-bucket-name --index-document index.html
Configure the bucket policy to allow CloudFront access only (recommended), or make the bucket public for simple use.

Avoid leaving the bucket open to the public to prevent unauthorized access.

2. Upload Website Files to the Bucket
bash
Copy
Edit
# Sync your local website directory to S3 bucket
aws s3 sync ./website-folder s3://your-unique-bucket-name
Replace ./website-folder with your local path containing the static website files.

3. Set Up CloudFront Distribution
In the AWS Console or via CLI, create a CloudFront distribution:

Set the origin domain to your S3 bucket’s website endpoint (e.g., your-unique-bucket-name.s3-website-us-east-1.amazonaws.com)

Enable SSL using AWS Certificate Manager (ACM) if you use a custom domain

Configure caching behaviors as needed

Optionally, use Origin Access Identity (OAI) to restrict direct S3 bucket access, allowing only CloudFront to fetch content.

4. Test Your Website
Open the CloudFront distribution URL in your browser.

Your static website should load quickly via the CDN.

5. Update Website Content and Invalidate Cache
To update content, sync the new files again:

bash
Copy
Edit
aws s3 sync ./website-folder s3://your-unique-bucket-name
Invalidate CloudFront cache to propagate changes immediately:

bash
Copy
Edit
aws cloudfront create-invalidation --distribution-id YOUR_DISTRIBUTION_ID --paths "/*"
Security Considerations
Use CloudFront Origin Access Identity (OAI) to prevent public S3 bucket access.

Avoid making S3 buckets publicly readable unless necessary.

Regularly review bucket policies and CloudFront settings.

Project Structure
bash
Copy
Edit
/website-folder
  ├── index.html
  ├── css/
  ├── js/
  └── images/
Place all static assets in the /website-folder directory before syncing to S3.

Next Steps / Enhancements
Automate deployment using Terraform or CloudFormation scripts

Add HTTPS with a custom domain via Route 53 and ACM

Configure CloudFront Lambda@Edge functions for personalization or redirects

Enable logging and monitoring via AWS CloudWatch

Resources & References
AWS S3 Static Website Hosting Guide

AWS CloudFront Developer Guide

How to Use Origin Access Identity

Contact
For questions or feedback, please open an issue or reach out.

yaml
Copy
Edit
