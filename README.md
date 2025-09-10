# ci-cd-templates
ci-cd-templates Reusable GitHub Actions and GitLab pipeline templates.
# CI/CD Templates

Reusable GitHub Actions workflows for the **Gitdigital Products** ecosystem.  
Keep your pipelines consistent, clean, and fast.

## 🚀 Included Workflows
- `rust-ci.yml` → Build + test Rust projects
- `docker-ci.yml` → Build + push Docker images
- `node-ci.yml` → Test Node.js apps

## 🛠️ Usage
In any repo, reference these templates in your `.github/workflows` directory.

Example:
```yaml
name: Reuse Rust CI
on: [push]

jobs:
  call-template:
    uses: Gitdigital-products/ci-cd-templates/.github/workflows/rust-ci.yml@main
