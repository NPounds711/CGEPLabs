# OSCAL — Lab 6.1

## What is here

| File | What it describes |
|---|---|
| `component-definitions/compliant-s3-v1/component-definition.json` | Describes how the `compliant-s3` Terraform module (Lab 2.3) implements NIST 800-53 Rev 5 controls |
| `profiles/cge-p-minimum/profile.json` | Selects the four controls implemented by the module from the NIST 800-53 Rev 5 catalog |

## Controls implemented

| Control | Description | Terraform resource |
|---|---|---|
| SC-28 | AES-256 server-side encryption, hardcoded | `aws_s3_bucket_server_side_encryption_configuration.primary` |
| AC-3 | Public access block on all four settings, hardcoded | `aws_s3_bucket_public_access_block.primary` |
| AU-3 | S3 access logging to dedicated log bucket | `aws_s3_bucket_logging.primary` |
| CM-6 | Required compliance tags enforced, versioning hardcoded | `aws_s3_bucket.primary` |

## Evidence

Evidence links in the component definition point to the Lab 2.5 signed evidence vault:

`s3://cgep-lab-grc-evidence-vault-79796fb3/runs/lab-2-3-20260508/bundle.tar.gz`

To verify the chain:

```bash
EVIDENCE_VAULT=cgep-lab-grc-evidence-vault-79796fb3 bash scripts/verify-evidence.sh lab-2-3-20260508
```

## Validation

Both documents validated with `compliance-trestle` v4.0.3 (OSCAL 1.2.1).
Validation output captured in `evidence/lab-6-1/trestle-validate.txt`.
