# compliant-gcs-bucket

Terraform module that provisions a CMEK-encrypted, audit-ready GCS bucket. Security controls are hardcoded inside the module; consumers configure only business-level inputs.

## Controls enforced

| NIST Control | Mechanism |
|---|---|
| SC-12 | Consumer-owned KMS keyring — encryption keys never leave the project |
| SC-13 / SC-28 | CMEK (AES-256) with 90-day automatic rotation (`rotation_period = 7776000s`) |
| AC-3 | `uniform_bucket_level_access = true` — IAM-only access, no legacy ACLs |
| AU-11 | `retention_policy` set from `var.retention_days`; prod enforces >= 365 days |
| CM-6 | Four required labels always merged: `project`, `environment`, `managed_by`, `compliance_scope` |

Public access is hard-blocked via `public_access_prevention = "enforced"` — consumers cannot override this.

## Usage

```hcl
module "data_bucket" {
  source = "../../modules/compliant-gcs-bucket"

  gcp_project        = "my-gcp-project"
  project_label      = "myapp"
  environment        = "prod"
  retention_days     = 365
  bucket_name_suffix = "prod-data-001"
}

output "attestation" { value = module.data_bucket.compliance_attestation }
```

## Variables

| Name | Description | Type | Default | Required |
|---|---|---|---|---|
| `gcp_project` | GCP project ID | `string` | — | yes |
| `project_label` | Short project identifier (3-21 chars, lowercase) | `string` | — | yes |
| `environment` | `dev`, `staging`, or `prod` | `string` | — | yes |
| `retention_days` | Object retention in days (prod requires >= 365) | `number` | — | yes |
| `bucket_name_suffix` | Globally-unique bucket name suffix (3-30 chars) | `string` | — | yes |
| `location` | GCS bucket location | `string` | `us-central1` | no |
| `kms_location` | KMS keyring location (single-region only) | `string` | `us-central1` | no |
| `labels` | Additional labels merged under required compliance labels | `map(string)` | `{}` | no |

> **Note on locations:** GCS buckets accept multi-region values like `US` or `EU`. KMS keyrings do not — they require a single-region value like `us-central1`. Use separate variables if you need a multi-region bucket.

## Outputs

| Name | Description |
|---|---|
| `bucket_url` | `gs://` URL of the bucket |
| `bucket_self_link` | Self-link of the bucket |
| `kms_key_id` | Resource ID of the CMEK |
| `compliance_attestation` | Map of control states — consumed by Lab 3 (Rego) and Lab 6 (OSCAL) |

### Example `compliance_attestation` output

```hcl
{
  encryption_algorithm     = "google-managed-cmek-aes256"
  kms_rotation_period      = "7776000s"
  public_access_prevention = "enforced"
  required_labels_present  = true
  retention_period_days    = 30
  uniform_access_enforced  = true
  versioning_enabled       = true
}
```

## Bucket naming

Buckets are named `{project_label}-{environment}-{bucket_name_suffix}`. GCS bucket names are globally unique — choose a suffix that won't collide.

## Cleanup

```bash
terraform destroy -auto-approve
```

`retention_policy.is_locked` is `false` in this module, so buckets can be destroyed immediately. KMS crypto keys enter a 30-day soft-delete state after destroy and cannot be fully purged sooner.
