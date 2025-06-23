Static Website Deployment with AWS S3 and CloudFront
Overview
This project demonstrates how to deploy a static website using Amazon S3 for storage and CloudFront for global content delivery. It focuses on building a simple, reliable, and cost-effective solution for serving static web content with improved performance and scalability.

Features
Static website hosting with Amazon S3

Global content delivery with AWS CloudFront

Infrastructure as Code using Terraform

Automatic provisioning of S3 bucket and CloudFront distribution

Secure, scalable, and maintainable setup

Technologies Used
AWS S3 — Static website storage

AWS CloudFront — Content Delivery Network (CDN)

Terraform — Infrastructure provisioning

AWS CLI — Optional, for interacting with AWS resources

Setup and Deployment
Prerequisites
AWS account with necessary permissions

AWS CLI installed and configured

Terraform installed

Steps
Clone the repository

bash
Copy code
git clone https://github.com/Tommy813-lab/static-s3-with-cloud-front.git
cd static-s3-with-cloud-front
Initialize and apply Terraform

bash
Copy code
terraform init
terraform apply
Upload your website files to S3
After the resources are created, upload your static website files (index.html, CSS, images, etc.) to the S3 bucket provisioned by Terraform. This can be done through the AWS Console or with the AWS CLI.

Access your website
Once your files are uploaded:

Via the S3 static website endpoint:
http://<your-bucket-name>.s3-website-<region>.amazonaws.com

Or via the CloudFront distribution domain provided in the Terraform output for better performance and HTTPS support.

Example Project Structure
bash
Copy code
/terraform         # Terraform configuration files
/static-site       # Example static website files (index.html, etc.)
README.md          # Project documentation
Notes
Ensure your S3 bucket has public read access for static site files.

CloudFront cache may need to be invalidated after content updates.

Bucket versioning and encryption are enabled for added security and durability.

Contact
Charles B
📧 buchercharles2@gmail.com
💻 GitHub - Tommy813-lab

