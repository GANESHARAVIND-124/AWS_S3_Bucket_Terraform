 Build a Secure AWS S3 Bucket with Terraform (For Hosting Static Websites)
🎯 Objective
Deploy a secure & highly available static website on AWS S3 using Terraform while ensuring security and performance with CloudFront, Route 53, and IAM policies.

🛠 Tech Stack
✔ AWS S3 – Static Web Hosting
✔ AWS CloudFront – Content Delivery Network (CDN)
✔ AWS Route 53 – Domain Name System (DNS)
✔ AWS IAM – Security Policies

📌 Key Tasks
1️⃣ Create an S3 Bucket for Static Website Hosting
Set up an S3 bucket to store website files.
Enable static website hosting with an index.html page.
Apply IAM policies & S3 bucket policies for security.

2️⃣ Attach CloudFront for Performance & Security
Configure CloudFront to serve the website globally.
Use Origin Access Control (OAC) to restrict S3 access only to CloudFront.
Set up HTTPS (SSL/TLS) encryption for secure traffic.

3️⃣ Configure a Custom Domain with Route 53
Register a domain name or use an existing one.
Create A-records in Route 53 pointing to CloudFront.
Ensure NS records match the domain registrar for proper DNS resolution.

4️⃣ Implement IAM & Security Policies
Restrict direct S3 access, allowing only CloudFront to serve content.
Apply a least privilege IAM role to manage resources securely.

📌 Deployment Steps
🔹 Step 1: Set Up Terraform & Variables
Initialize Terraform and define the S3, CloudFront, and Route 53 configurations.

🔹 Step 2: Deploy Infrastructure
sh
Copy
Edit
terraform init  
terraform validate  
terraform apply -auto-approve  
🔹 Step 3: Verify Website Availability
Check the Route 53 DNS records:

sh
Copy
Edit
aws route53 list-resource-record-sets --hosted-zone-id <HOSTED_ZONE_ID>
Access the website in a browser:
🔗 https://yourdomain.com

✅ Key Security Measures
✔ CloudFront OAC – Ensures only CloudFront can access S3.
✔ HTTPS via CloudFront – Encrypts all traffic.
✔ IAM Policies – Restricts access to resources.

🚀 Future Enhancements
🔹 Automate deployments with CI/CD pipelines.
🔹 Add AWS WAF for enhanced security.
🔹 Implement logging & monitoring for analytics.
