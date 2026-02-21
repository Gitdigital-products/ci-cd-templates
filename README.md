
# 🚀 Gitdigital CI/CD Templates
Standardized GitHub Actions workflows for high-performance Rust, Go, and TypeScript applications. This repository provides a "Golden Path" for Gitdigital products, ensuring security, speed, and consistency across all services.
## 🛠 Supported Stacks

| Language | Infrastructure | Security |
|---|---|---|
|  |  |  |
|  |  |  |
|  |  |  |

### 📖 How to Use
To use these templates, create a workflow file in your project repo (e.g., .github/workflows/ci.yml) and reference the desired template using @v1 (or your current version).
Example: Rust Microservice
name: CI
on: [push, pull_request]

jobs:
  # 1. Run Tests & Lints
  quality-gate:
    uses: Gitdigital-products/ci-cd-templates/.github/workflows/rust-ci.yml@v1

  # 2. Build & Push Image (only on main)
  deploy:
    needs: quality-gate
    if: github.ref == 'refs/heads/main'
    uses: Gitdigital-products/ci-cd-templates/.github/workflows/docker-reusable.yml@v1
    with:
      image_name: "gitdigital-api"
    secrets: inherit

#### 📂 Available Workflows

| Template | File | Description |
|---|---|---|
| Rust CI | rust-ci.yml | Cargo fmt, Clippy, and cached testing. |
| Go CI | go-ci.yml | Golangci-lint and race-detection testing. |
| Docker Build | docker-reusable.yml | Multi-arch builds with GHA caching. |
| IaC Validator | iac-check.yml | Terraform/OpenTofu formatting and validation. |
| Security Audit | security-audit.yml | Gitleaks secret detection and dependency review. |

##### 🤝 Contributing
 * Create a branch for your new template.
 * Ensure you follow the Variables Over Hardcoding rule.
 * Test the workflow in a dummy repo before PR-ing.
###### 🛡 Security First
All templates are configured by default to use least-privilege permissions. Always use secrets: inherit only when necessary, and prefer OIDC for cloud authentication.
