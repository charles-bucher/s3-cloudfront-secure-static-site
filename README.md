# Static Website Hosting with AWS S3 and CloudFront

## Project Overview
This project demonstrates how to host a static website on AWS using Amazon S3 for storage and Amazon CloudFront as a global Content Delivery Network (CDN). The setup provides fast, secure, and scalable delivery of static website content worldwide.

## What I Did
- Created an S3 bucket configured for static website hosting  
- Uploaded static website files (HTML, CSS, JS) to the S3 bucket  
- Configured bucket policy to allow public read access and restricted CloudFront access  
- Set up CloudFront distribution pointing to the S3 bucket endpoint  
- Configured SSL certificate using AWS Certificate Manager (ACM) for HTTPS  
- Tested website availability and performance via CloudFront  
- Enabled server-side encryption (SSE-S3) for data at rest  

## Bucket Details
- Bucket name: `mys3bucket813`  
- Region: us-east-2 (Ohio)  
- Static website endpoint: `http://mys3bucket813.s3-website.us-east-2.amazonaws.com`  
- Public access: Enabled via bucket policy  
- Versioning: Disabled  
- Encryption: SSE-S3 (Amazon-managed keys)  

## How to Deploy

### 1. Create and Configure the S3 Bucket
```bash
aws s3 mb s3://mys3bucket813 --region us-east-2
aws s3 website s3://mys3bucket813 --index-document index.html
2. Upload Website Files
bash
Copy
Edit
aws s3 sync ./website s3://mys3bucket813
Replace ./website with your local website folder path.

3. Set Bucket Policy for Public Read Access
Add this bucket policy (adjust bucket name and CloudFront distribution ARN):

json
Copy
Edit
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowPublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::mys3bucket813/*"
    },
    {
      "Sid": "AllowCloudFrontServicePrincipal",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudfront.amazonaws.com"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::mys3bucket813/*",
      "Condition": {
        "ArnLike": {
          "AWS:SourceArn": "arn:aws:cloudfront::281202093602:distribution/E3B27N2S0OOHK0"
        }
      }
    }
  ]
}
4. Create CloudFront Distribution
Origin domain: mys3bucket813.s3-website.us-east-2.amazonaws.com

Enable SSL with ACM certificate for HTTPS

Configure caching as needed

5. Test Website
Open your CloudFront domain URL in a browser. Your static site should load quickly.

6. Update Website Content
To update the site:

bash
Copy
Edit
aws s3 sync ./website s3://mys3bucket813
Invalidate CloudFront cache to apply changes immediately:

bash
Copy
Edit
aws cloudfront create-invalidation --distribution-id YOUR_DISTRIBUTION_ID --paths "/*"
Security Notes
Bucket owner enforced setting disables ACLs; all access controlled via bucket policy

Server-side encryption with SSE-S3 enabled by default

Bucket versioning is off — consider enabling for protection against accidental deletions

Next Steps / Enhancements
Enable bucket versioning for better object recovery

Add logging and monitoring with CloudWatch

Automate deployment using Terraform or CloudFormation

Use Origin Access Identity (OAI) to restrict S3 bucket access exclusively to CloudFront

Add custom domain with Route 53 and ACM for branded HTTPS

Resources
AWS S3 Static Website Hosting

AWS CloudFront Developer Guide

AWS Certificate Manager (ACM)

For questions or feedback, please open an issue or contact me directly.

yaml
Copy
Edit

---
