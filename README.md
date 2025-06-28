# AWS Bedrock Guardrails with Terraform

This project provides Infrastructure as Code (IaC) for provisioning and versioning AWS Bedrock Guardrails using [Terraform](https://www.terraform.io/). It enables consistent, scalable, and automated management of guardrails across environments.

## 📦 Project Structure

```plaintext
.
├── modules/
│ └── aws-guardrail/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
├── environments/
│ └── dev/
│ ├── main.tf
│ ├── terraform.tfvars
├── README.md
```

## 🚀 Features

- ✅ Create AWS Bedrock Guardrails using Terraform
- 🔁 Version control for guardrail configurations
- 🛡️ Declarative enforcement of content moderation rules
- 📚 Modular and reusable Terraform code

## 🔧 Prerequisites

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) >= 1.5
- AWS CLI configured with appropriate permissions
- AWS Bedrock enabled in your account

## 📥 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/rafaapaim/aws-bedrock-guardrails-terraform.git
cd aws-bedrock-guardrails-terraform
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Plan the Infrastructure

```bash
terraform plan
```

### 4. Apply the Configuration

```bash
terraform apply
```

## 🗃️ Versioning Guardrails

To manage guardrail versions, the module detects existing ARNs and conditionally creates new versions when needed. Use outputs to reference the current version ARN and integrate with other modules.

```hcl
output "guardrail_version_arn" {
  value = module.guardrail.guardrail_version_arn
}
```

## 🛑 Disclaimer

This project is not affiliated with AWS. Use at your own risk and validate all configurations in a non-production environment before deploying to production.
