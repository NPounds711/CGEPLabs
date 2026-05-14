# CGE-P Labs Portfolio

Welcome to my working portfolio for the **GRC Engineering Club's CGE-P certification**.

This repository demonstrates practical implementation of Cloud Security, Infrastructure as Code (IaC), and automated evidence collection pipelines.

## Repository Structure

* **`terraform/`**: Compliant infrastructure blueprints for AWS and GCP built with Terraform.
* **`policies/`**: Rego policy library mapped to NIST 800-53 controls, with GCP and AWS variants for SC-28, AC-3, and CM-6.
* **`scripts/`**: Automation scripts for evidence capture and policy gating.
* **`evidence/`**: JSON audit trails and test results proving the effectiveness of each lab's security controls.

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

---
*Maintained by Nicole Pounds*

