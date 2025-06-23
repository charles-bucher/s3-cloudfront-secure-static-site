
# Static Website with S3 and CloudFront (Terraform)

This project demonstrates how to deploy a **secure, scalable, static website** on AWS using **S3**, **CloudFront**, and **Terraform**. It follows infrastructure-as-code principles to automate the entire setup — a key skill for modern cloud engineers.

---

## 🚀 **Project Overview**

✅ Deploy a private S3 bucket to host website files  
✅ Configure a public CloudFront distribution to deliver content globally  
✅ Automate infrastructure deployment with Terraform  
✅ Improve performance and security using CloudFront CDN  
✅ Follows best practices for real-world Infrastructure as Code  

---

## 🛠️ **Tech Stack**

- **AWS S3** — Static website storage  
- **AWS CloudFront** — Global CDN for fast, secure delivery  
- **Terraform** — Infrastructure as Code (IaC)  
- **AWS IAM** — Secure access control  
- **Bash** — For local command-line operations  

---

## 🗂️ **Project Structure**

. ├── main.tf              # Core infrastructure resources ├── variables.tf         # Input variables ├── outputs.tf           # Output values (e.g., CloudFront URL) ├── provider.tf          # AWS provider configuration ├── s3-website-files/    # Static website content └── README.md            # Project documentation

---

## 🌍 **Architecture Diagram**

![Architecture Diagram](https://dummyimage.com/600x400/000/fff&text=S3+%2B+CloudFront+Architecture)

*Diagram shows how S3 stores website content and CloudFront distributes it globally.*

---

## ⚡ **Deployment Steps**

**Pre-Requisites:**  
✅ AWS CLI configured  
✅ Terraform installed  
✅ AWS credentials with permissions for S3, CloudFront, and IAM  

**Steps:**  

```bash
# Initialize Terraform
terraform init

# Preview changes
terraform plan

# Deploy infrastructure
terraform apply

# Grab your CloudFront URL from outputs and test the website


---

🧹 Teardown

terraform destroy

This will remove all resources created by the project.


---

🎯 Use Case

✅ Showcases AWS fundamentals
✅ Demonstrates real-world IaC skills
✅ Portfolio-ready for cloud/infra engineer roles
✅ Helps prepare for interviews or cert projects


---

📦 Future Improvements

Add HTTPS with ACM certificate

Integrate GitHub Actions for CI/CD

Auto-upload website content to S3 via pipeline



---

👤 Author

Tommy813-lab
