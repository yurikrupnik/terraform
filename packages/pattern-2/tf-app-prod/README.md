# pattern-2-tf-app-prod

Pattern 2 (prod reuses dev code), prod app. No code: only prod values and the tag of
`packages/pattern-2/tf-app-dev/stack` to run (`main.tf`).

```bash
npx nx run pattern-2-tf-app-prod:initialize   # re-downloads the stack when ?ref= changes
npx nx run pattern-2-tf-app-prod:plan
npx nx run pattern-2-tf-app-prod:apply
```

- Promote: bump `?ref=` to a newer `tf-app-dev-v*` tag, add any new prod values, PR, review plan.
- Rollback: set `?ref=` back to the previous tag.
- Changes to `pattern-2-tf-app-dev` do not affect this project (`nx affected`) until `?ref=` is bumped here.
