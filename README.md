# Static Website Hosting with S3 and CloudFront

## 📦 Project Overview
This project demonstrates how to host a secure, scalable static website using **Amazon S3** for storage and **CloudFront** for global content delivery. This architecture is commonly used for websites, portfolios, product landing pages, and static apps that require low-latency performance worldwide.

---

## 🏗️ Architecture Diagram

```plaintext
┌─────────────────────┐         ┌──────────────────┐
│      Users          │  HTTPS  │  CloudFront CDN  │
└─────────────────────┘  <────> └──────────────────┘
                              │  S3 Bucket (Website)
                              └──────────────────┘
```

---

## ☁️ Tech Stack
- **AWS S3** — Static Website Hosting
- **AWS CloudFront** — Content Delivery Network
- **Route 53** (Optional) — Custom Domain Management
- **Terraform** (Optional) — Infrastructure as Code
- **GitHub Actions** (Optional) — Automated Deployment

---

## 🚀 Features
✅ Global content delivery with CloudFront CDN  
✅ Secure, highly available static website hosting  
✅ Optional automation with Terraform and CI/CD  
✅ Infrastructure as Code ready for reproducibility  

---

## 📂 Project Structure
```plaintext
.
├── s3-website-files/       # Static website files (HTML, CSS, JS)
├── terraform/               # Terraform configuration (optional)
└── README.md                # Project documentation
```

---

## 🔧 Step-by-Step Deployment

### **Manual Steps:**
1. **Create S3 Bucket:**
   - Enable static website hosting
   - Upload your `index.html` and other site files
2. **Configure CloudFront:**
   - Set S3 bucket as origin
   - Enable HTTPS (optional)
3. **Access Website:**
   - Use the CloudFront domain or custom domain if configured

---

### **Automated with Terraform (Optional):**
1. Navigate to the `terraform/` directory:
   ```bash
   cd terraform
   ```
2. Initialize and deploy:
   ```bash
   terraform init
   terraform apply
   ```
3. Terraform provisions:
   - S3 Bucket
   - CloudFront Distribution
   - Optional Route 53 DNS records

---

### **Automated CI/CD with GitHub Actions (Optional):**
Set up a GitHub Actions workflow to automatically deploy updates to S3 and invalidate CloudFront cache on push. (Coming soon)

---

## 🌐 Live Demo (Optional)
Add your CloudFront or custom domain here once deployed.

---

## 🛡️ Security Best Practices
- Block public access at the bucket level, only allow CloudFront
- Enable CloudFront HTTPS
- Use S3 bucket policies for controlled access

---

## 🎯 Why This Project Matters
Static site hosting with S3 + CloudFront is a go-to solution for scalable, global, low-cost web hosting. It demonstrates core cloud skills employers look for in infrastructure and DevOps candidates.

---

## 📌 Future Improvements
- Full GitHub Actions deployment pipeline
- Terraform refinements (variable files, modules)
- Add custom domain with Route 53

---

## 🙌 Credits
Built by [Charles Bucher](https://github.com/Tommy813-lab) as part of cloud infrastructure learning projects.

---

