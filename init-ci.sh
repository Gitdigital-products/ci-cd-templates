#!/bin/bash
# Gitdigital CI/CD Initializer
# Usage: ./init-ci.sh [rust|go|node]

TYPE=$1
WORKFLOW_DIR=".github/workflows"
CI_FILE="$WORKFLOW_DIR/main.yml"

if [[ -z "$TYPE" ]]; then
  echo "Usage: ./init-ci.sh [rust|go|node]"
  exit 1
fi

mkdir -p $WORKFLOW_DIR

echo "Creating $TYPE CI workflow..."

cat <<EOF > $CI_FILE
name: CI/CD Pipeline
on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  security:
    uses: Gitdigital-products/ci-cd-templates/.github/workflows/security-audit.yml@v1

  build-and-test:
    needs: security
    uses: Gitdigital-products/ci-cd-templates/.github/workflows/$TYPE-ci.yml@v1

  docker-build:
    needs: build-and-test
    if: github.ref == 'refs/heads/main'
    uses: Gitdigital-products/ci-cd-templates/.github/workflows/docker-reusable.yml@v1
    with:
      image_name: "\${{ github.event.repository.name }}"
    secrets: inherit
EOF

echo "✅ Success! Template created at $CI_FILE"
echo "🚀 Commit and push to trigger your first Gitdigital-standard build."
