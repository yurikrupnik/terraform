# pattern-3-tf-app-prod

Pattern 3 (everything is a module), prod app. No code: the `tf-app-module` tag to run (`main.tf`) and prod values
(`terraform.tfvars`).

```bash
npx nx run pattern-3-tf-app-prod:initialize   # re-downloads the module when ?ref= changes
npx nx run pattern-3-tf-app-prod:plan
npx nx run pattern-3-tf-app-prod:apply
```

- Upgrade: bump `?ref=` to a newer `tf-app-module-v*` tag, add any new prod values to `terraform.tfvars`, PR, review plan.
- Rollback: set `?ref=` back to the previous tag.
