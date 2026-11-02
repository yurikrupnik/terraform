# pattern-3-tf-app-prod

Pattern 3 (everything is a module), prod app. No code: only prod values and the `tf-app-module` tag to run
(`main.tf`).

```bash
npx nx run pattern-3-tf-app-prod:initialize   # re-downloads the module when ?ref= changes
npx nx run pattern-3-tf-app-prod:plan
npx nx run pattern-3-tf-app-prod:apply
```

- Upgrade: bump `?ref=` to a newer `tf-app-module-v*` tag, add any new prod values, PR, review plan.
- Rollback: set `?ref=` back to the previous tag.
