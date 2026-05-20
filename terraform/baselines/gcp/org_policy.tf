# Org Policy requires a GCP Organization. This project is standalone (no org),
# so orgpolicy.policies.create is unavailable regardless of project-level IAM.
# These resources are included for reference and would apply in an org-enrolled project.

# resource "google_org_policy_policy" "uniform_bucket_access" {
#   name   = "projects/${var.gcp_project}/policies/storage.uniformBucketLevelAccess"
#   parent = "projects/${var.gcp_project}"
#   spec {
#     rules { enforce = "TRUE" }
#   }
# }

# resource "google_org_policy_policy" "disable_sa_keys" {
#   name   = "projects/${var.gcp_project}/policies/iam.disableServiceAccountKeyCreation"
#   parent = "projects/${var.gcp_project}"
#   spec {
#     rules { enforce = "TRUE" }
#   }
# }

# resource "google_org_policy_policy" "require_oslogin" {
#   name   = "projects/${var.gcp_project}/policies/compute.requireOsLogin"
#   parent = "projects/${var.gcp_project}"
#   spec {
#     rules { enforce = "TRUE" }
#   }
# }
