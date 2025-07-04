# 🛡️ Static Website Hosting with AWS S3, CloudFront & Terraform

## 📦 Project Overview

This project demonstrates how to deploy a **production-grade, secure, scalable static website** using:

✅ Amazon S3 for static site hosting  
✅ CloudFront CDN for fast global content delivery  
✅ Terraform for automated, reproducible infrastructure provisioning  
✅ GitHub Actions for CI/CD (Completed/Planned)  

This architecture mirrors real-world, production AWS setups used for portfolios, landing pages, and static apps.

---

## 🗺️ Architecture Diagram

```
┌─────────────────────┐      HTTPS      ┌─────────────────────┐
│      Users          │ <─────────────> │   CloudFront CDN    │
└─────────────────────┘                 └──────────┬──────────┘
                                                   │
                                Static Website Files│
                                                   ▼
                                      ┌─────────────────────┐
                                      │   S3 Bucket (Origin)│
                                      └─────────────────────┘
```

---

## ☁️ Tech Stack

| Service           | Purpose                            |
|-------------------|------------------------------------|
| **AWS S3**        | Static Website Storage & Hosting   |
| **AWS CloudFront**| Global Content Delivery & Caching  |
| **Terraform**     | Infrastructure as Code Provisioning|
| **Route 53** *(Optional)* | Custom Domain Management   |
| **GitHub Actions** *(Optional)* | CI/CD Automation     |

---

## 🚀 Features

✅ Global content delivery with CloudFront CDN  
✅ Highly available, secure static website hosting  
✅ Automated, reproducible infrastructure with Terraform  
✅ CI/CD pipeline with GitHub Actions (when configured)  
✅ Scalable foundation for portfolios, landing pages, product sites  

---

## 🗂️ Project Structure

```
.
├── Infrastructure/          # Infrastructure as Code (Terraform files)
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
│   └── README.md
│
├── Docs/                    # Documentation and resources
│
├── website/                 # Static website files (HTML, CSS, JS)
│   ├── index.html
│   └── styles.css
│
├── screenshots/             # Project screenshots (for README)
│
├── .github/workflows/       # GitHub Actions CI/CD pipeline
│   └── s3-deploy.yml
│
├── .gitignore
├── README.md
└── desktop.ini
```

---

## 🛠️ Step-by-Step Deployment

### Manual Deployment

1. **Create an S3 Bucket**  
   - Enable static website hosting  
   - Upload your website files  

2. **Configure CloudFront**  
   - Set your S3 bucket as the origin  
   - Enable HTTPS (Recommended)  

3. **Access your Website**  
   - Use the CloudFront domain  
   - Or your custom domain if configured  

---

### Automated Deployment with Terraform

**Prerequisite:** AWS CLI configured with valid credentials  

```bash
cd Infrastructure
terraform init
terraform plan
terraform apply
```

Terraform provisions:

✅ S3 Bucket with static website hosting  
✅ CloudFront Distribution with HTTPS  
✅ Optional Route 53 DNS records  

---

### CI/CD with GitHub Actions

When configured, GitHub Actions will:

- Auto-sync website files to S3 on push to `main`  
- Invalidate CloudFront cache to reflect updates  
- Run Terraform Plan & Apply (if configured)  

---

## 🌐 Live Demo

> [Insert your CloudFront URL or Custom Domain here]  
> Example: `https://d123abc456.cloudfront.net`  

---

## 📸 Screenshots

*Recommended screenshots to include:*  

- S3 Static Website configuration screen  
- CloudFront Distribution dashboard  
- Website live in browser  
- Terraform Apply output  
- GitHub Actions workflow successful run  

---

## 🛡️ Security Best Practices

✔️ Block public access to S3 — only CloudFront serves content  
✔️ Enable HTTPS via CloudFront  
✔️ Use S3 Bucket Policies for access control  
✔️ IAM permissions follow least-privilege principle  

---

## 🎯 Why This Project Matters

Deploying a static site with S3, CloudFront, Terraform, and CI/CD demonstrates core cloud skills:

✅ Infrastructure as Code with Terraform  
✅ Real-world AWS architecture for scalable hosting  
✅ Security-first design  
✅ Automation with CI/CD (when implemented)  

This project reflects practical, job-ready experience in cloud infrastructure — highly desirable for DevOps and Cloud Engineer roles.

---

## 🙌 Credits

Built and maintained by **Tommy813-lab** as part of my Cloud Infrastructure & DevOps learning journey.  
[GitHub Profile](https://github.com/Tommy813-lab)  
