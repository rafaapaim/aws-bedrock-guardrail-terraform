# AWS Bedrock Guardrails with Terraform

This project provides Infrastructure as Code (IaC) for provisioning and versioning AWS Bedrock Guardrails using [Terraform](https://www.terraform.io/). It enables consistent, scalable, and automated management of guardrails across environments.

## 📦 Project Structure

```plaintext
.
├── modules/
│ └── aws-guardrail/
| | ├── bedrock.tf
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ ├── outputs.tf
│ └── aws-guardrail-version/
| | ├── bedrock.tf
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ ├── outputs.tf
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
cd aws-bedrock-guardrails-terraform/module
```

### 2. Initialize, Plan the Infrastructure and Apply the Configuration

```bash
make all RESOURCE=<module-name>
```

### 3. Destroy resources

```bash
make destroy RESOURCE=<module-name>
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
