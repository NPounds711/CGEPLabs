# CGE-P Labs Portfolio

Welcome to my working portfolio for the **GRC Engineering Club's CGE-P certification**.

This repository demonstrates practical implementation of Cloud Security, Infrastructure as Code (IaC), and automated evidence collection pipelines.

## Repository Structure

* **`terraform/`**: Compliant infrastructure blueprints for AWS and GCP built with Terraform.
* **`policies/`**: Rego policy library mapped to NIST 800-53 controls, with GCP and AWS variants for SC-28, AC-3, and CM-6.
* **`scripts/`**: Automation scripts for evidence capture and policy gating.
* **`evidence/`**: JSON audit trails and test results proving the effectiveness of each lab's security controls.
* **`oidc/`**: Terraform module that creates the AWS IAM OIDC provider and role for GitHub Actions keyless authentication.
* **`.github/workflows/`**: GitHub Actions workflow that runs the GRC gate on every pull request.

## Labs

### Lab 2.3 — Compliant AWS S3 Bucket
Built a secure AWS S3 primitive enforcing server-side encryption and public access blocks using Terraform.

### Lab 2.4 — Compliant GCS Bucket Module
Authored a reusable GCP Cloud Storage module with compliant defaults and deployed it across dev and negative-test consumer environments.

### Lab 2.5 — Automated Evidence Vault
Implemented an automated evidence collection pipeline that hashes, bundles, and uploads Terraform workspace artifacts to a versioned S3 Object Lock vault for tamper-evident audit storage.

### Lab 3.3 — Writing Compliance Policies in Rego (GCP)
Authored three Rego policies mapping to NIST 800-53 controls (SC-28, AC-3, CM-6) against GCP resources. Each policy includes structured metadata, passing and failing test fixtures, and was validated against a real Terraform plan.

### Lab 3.4 — Integrating Policy as Code with Terraform via Conftest (AWS)
Extended the Rego policy library with AWS-specific variants for SC-28, AC-3, and CM-6. Built a `policy-gate.sh` script that runs Conftest as a fail-closed gate, demonstrated a blocked plan on non-compliant infrastructure, and captured pass/fail evidence.

### Lab 4.3 — GRC Evidence Pipeline (GitHub Actions)
Wired the policy gate into GitHub Actions using AWS OIDC for keyless authentication. Every pull request automatically runs Terraform plan, Conftest policy checks, and tfsec security scanning. Evidence artifacts are uploaded to each workflow run. Demonstrated both a failing PR (red) and a passing PR (green) with full audit trail.

### Lab 4.4 — Evidence Chain of Custody
Extended the evidence pipeline with cryptographic chain-of-custody guarantees. Evidence bundles are SHA-256 hashed, signed with Cosign keyless signing via GitHub Actions OIDC (Sigstore), and stored in an S3 Object Lock vault with WORM retention. A `verify-evidence.sh` script checks all three properties (integrity, authenticity, preservation) for any run. Demonstrated tamper detection: modifying a single byte of the bundle causes immediate SHA mismatch failure.

### Lab 5.2 — AWS Security Services Baseline
Deployed CloudTrail (multi-region, log-file validation), Security Hub with NIST 800-53 Rev 5 and FSBP standards, and AWS Config as the AWS-native compliance backbone. Captured Security Hub findings as a JSON evidence artifact. Controls satisfied: AU-2, AU-12, AU-10 (CloudTrail), RA-5, SI-4 (Security Hub), CM-2, CM-6, CM-8 (Config).

 ### Lab 5.4 — GCP Security Services Baseline
  Deployed Workload Identity Federation for GitHub Actions (replacing service account keys), enabled Data Access audit logs for Cloud Storage, Cloud KMS and IAM (off by default — the most common GCP audit finding), and documented Org Policy controls for org-enrolled projects. Controls satisfied: AC-2, IA-5
  (WIF), AU-2, AU-12 (audit logs), CM-6, AC-3 (Org Policy reference).

---
*Maintained by Nicole Pounds*
