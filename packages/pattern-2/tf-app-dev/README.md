# pattern-2-tf-app-dev

Pattern 2 (prod reuses dev code), dev app.

| Path               | What                                                                          |
| ------------------ | ----------------------------------------------------------------------------- |
| `stack/`           | the code once (Cloud Foundation Fabric modules); the only `variables.tf`      |
| `main.tf`          | calls `./stack` and passes `config` through                                   |
| `terraform.tfvars` | dev values (`config = { ... }`), auto-loaded                                  |

The repo root is the Terraform root: plain `terraform init && terraform plan` (what TFE runs), no extra
flags. Dev always runs the working copy of `stack/`; prod runs a tagged version of the same folder.

```bash
npx nx run pattern-2-tf-app-dev:initialize
npx nx run pattern-2-tf-app-dev:plan
npx nx run pattern-2-tf-app-dev:apply
```

## Release for prod

After dev applies cleanly, tag the commit: `git tag -a tf-app-dev-v2.1.0 -m "..."`. Prod
(`packages/pattern-2/tf-app-prod`) picks it up only when its `?ref=` is bumped.
