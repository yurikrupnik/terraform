# tf-app-prod

Prod Terraform app. No code: only prod values and the tag of `tf-app-dev/stack` to run (`main.tf`).

```bash
npx nx run tf-app-prod:initialize   # re-downloads the stack when ?ref= changes
npx nx run tf-app-prod:plan
npx nx run tf-app-prod:apply
```

- Promote: bump `?ref=` to a newer `tf-app-dev-v*` tag, add any new prod values, PR, review plan.
- Rollback: set `?ref=` back to the previous tag.
- Changes to `packages/tf-app-dev` do not affect this project (`nx affected` stays quiet) until `?ref=` is bumped here.
