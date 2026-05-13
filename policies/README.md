# Compliance Policy Library

Rego policies mapped to NIST 800-53 controls. Each policy evaluates a Terraform `plan.json` and emits actionable deny messages that include the resource address and control ID.

## Policies

| File | Control | Severity | Enforces |
|------|---------|----------|----------|
| `sc28_encryption.rego` | SC-28 | High | Every `google_storage_bucket` must have a CMEK `encryption` block. |
| `ac3_no_public.rego` | AC-3 | Critical | Buckets must have `uniform_bucket_level_access=true` and `public_access_prevention="enforced"`. Firewalls must not expose ports 22 or 3389 to `0.0.0.0/0`. |
| `cm6_required_tags.rego` | CM-6 | Medium | Every taggable resource must carry four labels: `project`, `environment`, `managed_by`, `compliance_scope`. |

## Running the tests

```bash
opa test -v policies/
```

## Evaluating against a plan

```bash
opa eval -d policies -i terraform/plan.json data.compliance.sc28.deny --format=pretty
opa eval -d policies -i terraform/plan.json data.compliance.ac3.deny --format=pretty
opa eval -d policies -i terraform/plan.json data.compliance.cm6.deny --format=pretty
```
