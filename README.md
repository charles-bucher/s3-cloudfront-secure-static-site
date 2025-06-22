<!DOCTYPE html>
<html>
  <head>
    <title>Static S3 + CloudFront</title>
  </head>
  <body>
    <h1>Hello from my static site on S3!</h1>
    <p>Delivered with CloudFront</p>
  </body>
</html>
deploy.sh
This is your Bash script to create the bucket, upload your site, and apply permissions.

bash
Copy
Edit
#!/bin/bash

# ==== CONFIG ====
BUCKET_NAME="mys3bucket813"
REGION="us-east-1"

# ==== CREATE BUCKET ====
aws s3api create-bucket \
  --bucket $BUCKET_NAME \
  --region $REGION \
  --create-bucket-configuration LocationConstraint=$REGION

# ==== ENABLE STATIC WEBSITE ====
aws s3 website s3://$BUCKET_NAME/ \
  --index-document index.html

# ==== UPLOAD FILE ====
aws s3 cp index.html s3://$BUCKET_NAME/ \
  --acl public-read

# ==== SET BUCKET POLICY ====
aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy "{
  \"Version\": \"2012-10-17\",
  \"Statement\": [
    {
      \"Effect\": \"Allow\",
      \"Principal\": \"*\",
      \"Action\": \"s3:GetObject\",
      \"Resource\": \"arn:aws:s3:::$BUCKET_NAME/*\"
    }
  ]
}"

echo "✅ Static website deployed:"
echo "   http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
README.md
What recruiters/devs will see first when they land on your repo:

# 🛰️ Static S3 Website with CloudFront

This project creates a simple static website using AWS S3 and optionally fronted with CloudFront.
