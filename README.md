Static Website Hosting with AWS S3 & CloudFront
Host a fast, scalable, and secure static website using AWS S3 and CloudFront CDN

Project Purpose
This project demonstrates how to deploy a fully static website using Amazon S3 for storage and AWS CloudFront as a global content delivery network (CDN). It ensures low-latency, high availability, and HTTPS security for static web assets with zero server management.

Features
Host static website content on S3 with public read access

Use CloudFront distribution for CDN acceleration and HTTPS

Cache control for improved website performance

Simple setup leveraging AWS infrastructure-as-code concepts

Easily customizable for any static site (HTML, CSS, JS, images)

Prerequisites
AWS CLI installed and configured with proper permissions

AWS account with S3 and CloudFront access

Terraform (if used for deployment automation) or AWS Management Console access

Basic knowledge of AWS services and static website hosting concepts

Setup & Deployment
Manual Setup (AWS Console)
Create an S3 bucket configured for static website hosting

Upload your static site files (HTML, CSS, JS) to the bucket

Set bucket policy for public read access

Create a CloudFront distribution pointing to the S3 bucket endpoint

Configure SSL certificate for HTTPS (optional, via AWS Certificate Manager)

Update DNS settings (Route 53 or other DNS) to point to CloudFront domain

Automated Setup (Terraform / Scripts)
(If applicable — insert instructions here on running Terraform or deployment scripts)

Usage
Upload or update static files in the S3 bucket to update your website content

Access your website via the CloudFront distribution URL or your custom domain

Monitor and manage performance via AWS CloudFront metrics and S3 usage reports

Technical Details
S3 bucket configured with static website hosting enabled

Bucket policy allows public read for website files

CloudFront distribution with origin set to S3 bucket static website endpoint

Cache behavior optimized for static content delivery

Optional SSL with AWS Certificate Manager for HTTPS security

Notes
Ensure that sensitive files are not uploaded to the public bucket

Configure cache invalidation in CloudFront for instant updates if needed
