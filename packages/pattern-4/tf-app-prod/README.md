# pattern-4-tf-app-prod

Pattern 4 (one monorepo), prod app. Same repo as the code and dev, but prod runs a pinned landing-zone release
of the shared stack (`?ref=lz-vX.Y.Z` in `main.tf`), with prod values in `terraform.tfvars`.

```bash
npx nx run pattern-4-tf-app-prod:initialize   # re-downloads the stack when ?ref= changes
npx nx run pattern-4-tf-app-prod:plan
npx nx run pattern-4-tf-app-prod:apply
```

- Release: tag the repo after dev is green (`git tag -a lz-v1.1.0`), then set `?ref=lz-v1.1.0` here.
  With more components, every prod app pins the same `lz-v*`, bumped together in one PR.
- Rollback: set `?ref=` back to the previous `lz-v*`.
- Protection (no separate prod repo): code owners on this folder, who may create `lz-v*` tags, and TFE approval.
