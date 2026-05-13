# CGE-P Labs Portfolio

Welcome to my working portfolio for the **GRC Engineering Club's CGE-P certification**.

This repository demonstrates practical implementation of Cloud Security, Infrastructure as Code (IaC), and automated evidence collection pipelines.

## Repository Structure

* **`terraform/`**: Compliant infrastructure blueprints for AWS and GCP built with Terraform.
* **`scripts/`**: Automation scripts, including an evidence capture script (`capture-evidence.sh`) that bundles Terraform artifacts and uploads them to an S3 Object Lock vault.
* **`evidence/`**: JSON audit trails and state snapshots proving the effectiveness of each lab's security controls.

## Labs

### Lab 2.3 — Compliant AWS S3 Bucket
Built a secure AWS S3 primitive enforcing server-side encryption and public access blocks using Terraform.

### Lab 2.4 — Compliant GCS Bucket Module
Authored a reusable GCP Cloud Storage module with compliant defaults and deployed it across dev and negative-test consumer environments.

### Lab 2.5 — Automated Evidence Vault
Implemented an automated evidence collection pipeline that hashes, bundles, and uploads Terraform workspace artifacts to a versioned S3 Object Lock vault for tamper-evident audit storage.

---
*Maintained by Nicole Pounds*
