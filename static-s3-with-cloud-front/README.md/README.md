🌐 Static Website Deployment with AWS S3 and CloudFront
This project demonstrates how to deploy a static website using Amazon S3 for storage and CloudFront for global content delivery. The goal is to build a simple, reliable, and cost-effective solution for serving static web content with enhanced performance and scalability.

🖼️ Architecture Diagram (ASCII Style)
sql
Copy code
               +--------------------+
               |   GitHub Repo      |
               | (HTML, CSS, JS)    |
               +--------+-----------+
                        |
                        | Push
                        v
               +--------+-----------+
               |   GitHub Actions   |
               |  (CI/CD Workflow)  |
               +--------+-----------+
                        |
               +--------v-----------+
               |     Amazon S3      |
               | (Static Website)   |
               +--------+-----------+
                        |
                        v
               +--------+-----------+
               |   AWS CloudFront   |
               | (Global CDN + SSL) |
               +--------+-----------+
                        |
                        v
               +--------+-----------+
               |    End Users       |
               | (Fast, Secure Web) |
               +--------------------+
🖼️ Optional: Use a Visual Diagram (PNG/SVG)
You can also use a clean visual diagram if you're sharing this on GitHub Pages or internally:

📷 Add this image to your repo, for example /docs/architecture.png, and embed like this:

markdown
Copy code
![Static Site Architecture](docs/architecture.png)
Or hotlink to one hosted externally (just make sure it's always available).

🚀 Features
✅ Static website hosting on Amazon S3
✅ Global content delivery via AWS CloudFront
✅ Fast, secure, and scalable setup
✅ Manual or automated deployment using GitHub Actions
✅ Publicly accessible static content with HTTPS support

🧰 Technologies Used
Amazon S3 – Static file storage (HTML, CSS, JS)

AWS CloudFront – CDN for fast, secure global delivery

AWS CLI – For resource management

GitHub Actions – Automates deployment & cache invalidation

⚙️ Setup and Deployment
✅ Prerequisites
AWS account + permissions

AWS CLI installed and configured

GitHub repo (for CI/CD optional)

S3 bucket & CloudFront distribution set up

📦 Steps
1. Upload Static Website to S3
bash
Copy code
aws s3 sync ./static-site s3://your-s3-bucket-name --delete
Make sure static hosting is enabled and the bucket allows public read access.

2. Invalidate CloudFront Cache (optional)
bash
Copy code
aws cloudfront create-invalidation \
  --distribution-id YOUR_CLOUDFRONT_DIST_ID \
  --paths "/*"
3. Access Your Website
S3 URL:
http://your-bucket-name.s3-website-region.amazonaws.com

CloudFront URL (Recommended):
https://your-distribution-id.cloudfront.net

🗂️ Project Structure
bash
Copy code
/static-site         # Your static website files (HTML, CSS, JS)
/.github/workflows   # GitHub Actions deployment workflow
README.md            # This documentation
🔐 Notes
S3 bucket must allow public read access (or use signed URLs)

CloudFront enables HTTPS by default

GitHub Actions automates syncing + invalidation on push

📫 Contact
Charles B
📧 buchercharles2@gmail.com
💻 GitHub: Tommy813-labs
