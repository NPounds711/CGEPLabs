# CGE Lab 2.3 — Compliant S3 Bucket

This module enforces SC-28, AU-3, AU-6, CM-6, and AC-3 on a single S3 bucket. It provisions a primary data bucket and a dedicated access-log bucket with AES-256 encryption at rest, access logging, object versioning, public access blocking, and required compliance tags — all hardcoded so consumers cannot disable them.

## Resources created

| Resource | Purpose |
|---|---|
| `aws_s3_bucket.primary` | Primary data bucket |
| `aws_s3_bucket_server_side_encryption_configuration.primary` | AES-256 encryption at rest |
| `aws_s3_bucket_versioning.primary` | Object versioning (enabled) |
| `aws_s3_bucket_public_access_block.primary` | Block all public access |
| `aws_s3_bucket_logging.primary` | Access logs → log bucket |
| `aws_s3_bucket.log` | Dedicated access-log bucket |
| `aws_s3_bucket_server_side_encryption_configuration.log` | AES-256 encryption on log bucket |
| `aws_s3_bucket_public_access_block.log` | Block all public access on log bucket |
| `aws_s3_bucket_ownership_controls.log` | BucketOwnerPreferred (required for log-delivery-write ACL) |
| `aws_s3_bucket_acl.log` | `log-delivery-write` ACL for S3 access logging service |
| `random_id.bucket_suffix` | 4-byte hex suffix for globally unique bucket names |

## Compliance tags applied (via provider default_tags)

| Tag | Value |
|---|---|
| `Project` | `var.project_name` |
| `Environment` | `var.environment` |
| `ManagedBy` | `terraform` |
| `ComplianceScope` | `cge-p-lab` |

## Usage

```hcl
module "compliant_s3" {
  source       = "./terraform/primitives/compliant-s3"
  project_name = "myapp"
  environment  = "prod"
}
```

## Variables

| Name | Description | Type | Default | Required |
|---|---|---|---|---|
| `project_name` | Short project identifier (lowercase, numbers, hyphens) | `string` | — | yes |
| `environment` | Deployment environment (`dev`, `staging`, `prod`) | `string` | — | yes |
| `bucket_suffix` | Override the random hex suffix for deterministic naming | `string` | `""` | no |

## Outputs

| Name | Description |
|---|---|
| `bucket_name` | Primary bucket name (ID) |
| `bucket_arn` | Primary bucket ARN |
| `log_bucket_arn` | Log bucket ARN |
| `encryption_algorithm` | SSE algorithm in use — `AES256` (SC-28 attestation value) |

## Deploy

```bash
cd terraform/primitives/compliant-s3

terraform init
terraform plan -var="project_name=cgeplab" -var="environment=dev" -out=tfplan
terraform apply tfplan
```

## Collect evidence

```bash
terraform show -json tfplan > evidence/plan.json
terraform show -json       > evidence/state.json
```
