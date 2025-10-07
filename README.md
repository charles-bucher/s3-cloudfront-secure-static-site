# S3 CloudFront Secure Static Site

## Why this matters
This isn’t just a static site — it’s a fully locked-down, secure hosting solution that proves I know AWS and cloud security inside and out.

## Architecture
📌 Diagram: docs/architecture/architecture.png  
Shows S3 bucket, CloudFront distribution, IAM policies.

## What it does
- Lock down S3 bucket so no one accesses it directly
- Deliver content fast with CloudFront
- Add security headers
- Automate deployment

## How to run
1. Clone this repo
2. Run `./scripts/deploy.sh`
3. Check the live site

## Security
IAM least privilege, HTTPS only, no hard-coded credentials.

## Cost efficiency
CloudFront caching + S3 lifecycle policies.

— Built by Charles.

