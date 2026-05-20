# Lab 5.2 — AWS Security Services Baseline

## Services deployed

| Service | Controls satisfied |
|---|---|
| CloudTrail (multi-region, log-file validation) | AU-2, AU-12, AU-10 |
| Security Hub (NIST 800-53 Rev 5 + FSBP) | RA-5, SI-4 |
| AWS Config (recorder, delivery channel, IAM role) | CM-2, CM-6, CM-8 |

## Notes

All three services were deployed successfully in a standalone AWS sandbox account (no org-level SCPs).
Security Hub findings are captured in `evidence/lab-5-2/security-hub-findings.json`.
