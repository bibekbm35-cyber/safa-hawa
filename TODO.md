# Code hygine (Lint Test Git hook)

- Install ruff and eslint
- Setup basic linting rules
- Setup dummy test for python and node
- Setup pre commit hooks for linting and gitleaks

# Docker
- Setup Docker file
    - Multi stage
    - Hardned image (No CVE)
    - Replace local env with docker compose
    - dockerignore
    - noroot

# CI
- Lint, Test, Build
- Setup trivy for CVE
- Push image ghcr
- Scan for secrets usign gitleaks

# K8s
- Readiness and liveleness probes
- Resource limits
- Init container


