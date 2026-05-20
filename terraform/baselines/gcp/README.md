# Lab 5.4 — GCP Security Services Baseline

## Services deployed

| Service | Controls satisfied |
|---|---|
| Workload Identity Federation (GitHub Actions, no keys) | AC-2, IA-5 |
| Data Access audit logs (Storage, KMS, IAM) | AU-2, AU-12 |
| Org Policy (reference only — requires GCP Organization) | CM-6, AC-2, AC-3 |

## Notes

**Data Access audit logs are off by default in GCP** — enabling them is the most common GCP audit finding.
Audit logs were enabled for `storage.googleapis.com`, `cloudkms.googleapis.com`, and `iam.googleapis.com`.

**WIF** replaces long-lived service account keys with short-lived OIDC tokens scoped to `NPounds711/CGEPLabs` only.

**Org Policy** requires a GCP Organization. This project is standalone (no org enrolled),
so `orgpolicy.policies.create` is unavailable. The Terraform resources are included commented-out
in `org_policy.tf` for reference and would apply in an org-enrolled project.
