# 🚀 Deploy a Secure Static Website on AWS S3 with Terraform
![Secure Static Website Architecture on AWS: S3, CloudFront, and Route 53](<AWS Static Website Hosting.drawio.png>)
## 🎯 Objective
This project aims to securely deploy a static website using AWS S3, CloudFront, Route 53, and IAM with Terraform. The website will be highly available, performant, and protected from unauthorized access.

## **Prerequisites**
- **AWS account**
- **Terraform installed** (`>= v1.5`)
- **AWS CLI configured**

## 🛠 Tech Stack

| Service        | Purpose                                                  |
|----------------|---------------------------------------------------------|
| AWS S3        | Static website hosting                                   |
| AWS CloudFront | Content Delivery Network (CDN) for performance & security|
| AWS Route 53   | Domain Name System (DNS) for custom domain             |
| AWS IAM        | Security policies to control access                     |

## 📁 Project Structure
```
AWS_S3_BUCKET_TERRAFORM/
│
├── .terraform/                      # Terraform's internal files and state
│   ├── .terraform.lock.hcl          # Lock file for provider versions
│   ├── terraform.tfstate            # Current infrastructure state
│   └── modules/                     # Cached modules (if used)
│
├── backend.tf                       # Backend configuration for Terraform state management
├── main.tf                          # Main Terraform configuration file (calls modules)
├── providers.tf                     # Provider configuration (e.g., AWS)
├── terraform.tfvars                 # Variable values for Terraform configuration
├── variables.tf                     # Variable definitions
├── index.html                       # Homepage of the static website
├── error.html                       # Custom error page
│
├── modules/                          # Custom modules for organizing resources
│   ├── s3/                           # Module for S3 Static Website Hosting
│   │   ├── main.tf                   # S3 bucket configuration (with static website enabled)
│   │   ├── s3-policy.json            # JSON policy for securing S3 access
│   │   ├── outputs.tf                # Outputs for the S3 module
│   │   └── variables.tf              # Variables for the S3 module
│   │
│   ├── cloudfront/                   # Module for CloudFront (CDN and security)
│   │   ├── main.tf                   # CloudFront distribution configuration
│   │   ├── origin-access-control.tf  # CloudFront OAC setup for secure access
│   │   ├── outputs.tf                # Outputs for the CloudFront module
│   │   └── variables.tf              # Variables for the CloudFront module
│   │
│   ├── route53/                      # Module for Domain Management (Route 53)
│   │   ├── main.tf                   # Route 53 hosted zone & DNS configuration
│   │   ├── outputs.tf                # Outputs for the Route 53 module
│   │   └── variables.tf              # Variables for the Route 53 module
├── website/                          # Static website files
│   ├── index.html                    # Homepage
│   ├── error.html                    # Custom error page
│   ├── styles.css                    # Styling
│   ├── assets/                        # Images and logos
│
└── README.md                         # Documentation and project instructions
```

## 📌 Key Tasks & Architecture

1. **Create an S3 Bucket for Static Website Hosting**
    - Set up an S3 bucket to store website files.
    - Enable static website hosting with an `index.html` page.
    - Apply IAM policies & S3 bucket policies for security.

2. **Attach CloudFront for Performance & Security**
    - Configure CloudFront to distribute website content globally.
    - Use Origin Access Control (OAC) to restrict S3 access only to CloudFront.
    - Set up HTTPS (SSL/TLS) encryption to secure website traffic.

3. **Configure a Custom Domain with Route 53**
    - Register a domain using Route 53 (or use an existing one).
    - Create A-records in Route 53 pointing to CloudFront.
    - Ensure NS records match the domain registrar for proper DNS resolution.

4. **Implement IAM & Security Policies**
    - Restrict direct S3 access, allowing only CloudFront to serve content.
    - Apply least-privilege IAM roles to manage resources securely.
    - Use CloudFront Signed URLs or Signed Cookies if advanced security is needed.

## 📌 Deployment Steps

**Set Up Terraform & Variables**  
Ensure you have Terraform installed and AWS credentials configured.  
Clone this repository and navigate to the Terraform directory.


1. **Initialize Terraform**
   ```sh
   terraform init
   ```
2. **Plan the Deployment**
   ```sh
   terraform plan
   ```
3. **Apply Terraform Configuration**
   ```sh
   terraform apply -auto-approve
   ```
4. **Access the Application**
   - Retrieve ALB DNS:
     ```sh
     terraform output alb_dns
     ```
   - Open the DNS URL in a browser.
   - 🔗 https://yourdomain.com

## **Destroy Infrastructure**
To remove all AWS resources:
```sh
terraform destroy -auto-approve
```
**Step 3: Verify Website Availability**

- Check if the Route 53 DNS records are properly configured:
```
aws route53 list-resource-record-sets --hosted-zone-id <HOSTED_ZONE_ID>
```
