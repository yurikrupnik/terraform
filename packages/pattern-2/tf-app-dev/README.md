# pattern-2-tf-app-dev

Pattern 2 (prod reuses dev code), dev app.

| Path               | What                                                                          |
| ------------------ | ----------------------------------------------------------------------------- |
| `stack/`           | the code once (Cloud Foundation Fabric modules); the only `variables.tf`      |
| `terraform.tfvars` | dev values (`config = { ... }`)                                               |

Dev runs `stack/` directly as its Terraform root (`-var-file=../terraform.tfvars`), always from the working
copy. Prod runs a tagged version of the same folder as a module.

```bash
npx nx run pattern-2-tf-app-dev:initialize
npx nx run pattern-2-tf-app-dev:plan
npx nx run pattern-2-tf-app-dev:apply
```

## Release for prod

After dev applies cleanly, tag the commit: `git tag -a tf-app-dev-v2.1.0 -m "..."`. Prod
(`packages/pattern-2/tf-app-prod`) picks it up only when its `?ref=` is bumped.
