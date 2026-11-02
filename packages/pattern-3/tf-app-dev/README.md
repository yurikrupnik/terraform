# pattern-3-tf-app-dev

Pattern 3 (everything is a module), dev app. No code: the `tf-app-module` tag to run (`main.tf`) and dev values
(`terraform.tfvars`).

```bash
npx nx run pattern-3-tf-app-dev:initialize   # re-downloads the module when ?ref= changes
npx nx run pattern-3-tf-app-dev:plan
npx nx run pattern-3-tf-app-dev:apply
```

- Upgrade: bump `?ref=` to a newer `tf-app-module-v*` tag, add any new dev values to `terraform.tfvars`, PR, review plan.
- Rollback: set `?ref=` back to the previous tag.
