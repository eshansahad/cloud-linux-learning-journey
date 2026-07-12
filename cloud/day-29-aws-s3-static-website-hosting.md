# Day 29 — Amazon S3 Static Website Hosting

**Date:** July 10, 2026

---

# Objective

Learn how to host a fully static website using Amazon S3 by creating a public bucket, uploading website files, configuring static website hosting, applying bucket policies, and verifying public accessibility.

---

# What is Amazon S3?

Amazon Simple Storage Service (Amazon S3) is AWS's highly scalable object storage service.

It is commonly used for:

- Static website hosting
- File storage
- Application assets
- Backups
- Media hosting
- Software downloads
- Data lakes

S3 stores data as **objects** inside **buckets**.

---

# Lab Overview

In this practical lab, I deployed a static website directly from an Amazon S3 bucket without using EC2 or any web server.

The deployment included:

- Creating an S3 bucket
- Uploading website files
- Enabling static website hosting
- Configuring public access
- Creating a bucket policy
- Testing the public website endpoint

---

# Services Used

- Amazon S3
- AWS IAM
- AWS Console

---

# Step 1 — Create an S3 Bucket

Created a new S3 bucket with:

- Globally unique bucket name
- Appropriate AWS Region
- Default storage settings

To allow public website hosting:

- Disabled **Block all public access**
- Confirmed the AWS warning

---

# Step 2 — Upload Website Files

Uploaded all website assets including:

- index.html
- CSS files
- JavaScript files
- Images
- Other supporting resources

Maintained the original folder structure.

---

# Step 3 — Enable Static Website Hosting

Enabled:

Properties

→ Static Website Hosting

Configuration:

- Hosting Type: Static Website
- Index Document:

```
index.html
```

(Optional)

```
error.html
```

AWS generated a Website Endpoint URL.

Example:

```
http://bucket-name.s3-website-region.amazonaws.com
```

---

# Step 4 — Configure Public Access

Configured bucket permissions.

Created a bucket policy allowing public read access.

Example policy:

```json
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Effect":"Allow",
      "Principal":"*",
      "Action":"s3:GetObject",
      "Resource":"arn:aws:s3:::YOUR-BUCKET/*"
    }
  ]
}
```

This allows visitors to read website files.

---

# Step 5 — Test Website

Opened the generated S3 Website Endpoint.

Verified:

- Homepage loaded successfully
- CSS loaded correctly
- Images displayed
- JavaScript executed properly
- Navigation links worked

---

# Troubleshooting

## Access Denied

Possible causes:

- Bucket policy missing
- Public access still blocked
- Incorrect bucket ARN
- Objects not publicly readable

---

## 403 Forbidden

Verify:

- Static Website Hosting enabled
- Bucket Policy applied
- Block Public Access disabled

---

## Missing Images

Usually caused by:

- Incorrect file paths
- Folder structure changed
- Case-sensitive filenames

---

# Updating the Website

To publish future changes:

- Upload updated files
- Replace existing objects

Or use AWS CLI:

```bash
aws s3 sync ./website s3://bucket-name --delete
```

The `--delete` option removes files that no longer exist locally.

---

# Advantages of S3 Static Hosting

- Serverless
- Low cost
- Highly available
- Durable storage
- Easy deployment
- Scalable
- No server maintenance

---

# Skills Learned

- Amazon S3
- Bucket Creation
- Object Storage
- Static Website Hosting
- Bucket Policies
- Public Access Configuration
- Website Deployment
- AWS Console Navigation

---

# Outcome

Successfully deployed a static website using Amazon S3.

The website became publicly accessible through the generated S3 Website Endpoint after enabling static hosting and applying the appropriate bucket policy.

---

# Key Takeaways

- S3 can host static websites without EC2.
- Public access requires both disabling block public access and configuring a bucket policy.
- The website endpoint is generated after enabling Static Website Hosting.
- Future updates can be automated using the AWS CLI sync command.
- Amazon S3 provides a simple, scalable, and cost-effective hosting solution for static websites.