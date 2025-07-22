
# 🚀 AWS EC2 Provisioning with Docker, Java 17, and Maven using Terraform

This Terraform project launches **Ubuntu EC2 instances** in a specified VPC and installs **Docker**, **Java 17**, and **Maven** using `user_data`.

---

## 📂 Project Structure

```
.
├── main.tf          # EC2 provisioning with software installation
├── output.tf        # Output of instance public IPs and IDs
├── provider.tf      # AWS provider configuration
├── variables.tf     # Input variables
└── README.md        # Documentation
```

---

## ⚙️ What This Project Does

- Dynamically gets subnets from a specified VPC using `data "aws_subnets"`.
- Launches multiple EC2 instances (`count` based).
- Installs:
  - Docker
  - Java 17 (OpenJDK)
  - Maven
- Outputs public IPs and instance IDs.

---

## 📌 Prerequisites

- Terraform v1.x installed
- AWS CLI configured (`aws configure`)
- A key pair created in AWS
- Existing VPC and Security Group ID

---

## 🔧 How to Use

### 1. Clone the Repository
```bash
git clone https://github.com/shubhamdhole97/instance_from_tf.git
cd instance_from_tf
```

### 2. Customize Variables

Edit `variables.tf` if needed or create a `terraform.tfvars` file:
```hcl
instance_count     = 2
ami_id             = "ami-0f918f7e67a3323f0"
instance_type      = "t3.medium"
key_name           = "pem"
security_group_id  = "sg-0d60ad85ad224e89e"
vpc_id             = "vpc-0af2ef483f73e0f77"
```

---

## 📘 Terraform Commands Explained

### ✅ `terraform init`
Initializes the working directory. Downloads required provider plugins.
```bash
terraform init
```

### 🔍 `terraform plan`
Shows what resources will be created/modified/destroyed before applying.
```bash
terraform plan
```

### 🚀 `terraform apply`
Applies the infrastructure changes. It will prompt for approval.
```bash
terraform apply
```

### 📏 `terraform validate`
Checks whether the Terraform code is syntactically valid.
```bash
terraform validate
```

### 🧹 `terraform destroy`
Destroys all the resources defined in your Terraform files.
```bash
terraform destroy
```

---

## 📦 Output

After `terraform apply`, you'll get:
- **Public IPs** of all EC2 instances
- **Instance IDs**

Example:
```bash
instance_public_ips = [
  "13.235.122.123",
  "3.108.45.67"
]

instance_ids = [
  "i-0abcd1234ef567890",
  "i-0abcd1234ef567891"
]
```

---

## 📄 Author

**Shubham Dhole**  
🔗 GitHub: [shubhamdhole97](https://github.com/shubhamdhole97)

---


