# pattern-2-tf-app-dev

Pattern 2 (prod reuses dev code), dev app.

| Path               | What                                                                          |
| ------------------ | ----------------------------------------------------------------------------- |
| `stack/`           | the code once (Cloud Foundation Fabric modules); full `config` schema         |
| `main.tf`          | calls `./stack` and passes `config` through                                   |
| `variables.tf`     | declares `config` (one block; schema lives in `stack/variables.tf`)           |
| `terraform.tfvars` | dev values (`config = { ... }`), auto-loaded                                  |

The repo root is the Terraform root: plain `terraform init && terraform plan` (what TFE runs), no extra
flags. Dev always runs the working copy of `stack/`; prod runs a tagged version of the same folder.

```bash
npx nx run pattern-2-tf-app-dev:initialize
npx nx run pattern-2-tf-app-dev:plan
npx nx run pattern-2-tf-app-dev:apply
```

## Dev-only resources

The stack can hold resources that only some environments create. They are switched on by an optional
`config` setting, not by checking the environment name: `module "scratch_bucket"` has
`count = var.config.scratch_bucket == null ? 0 : 1`. Dev's `terraform.tfvars` sets `scratch_bucket`; prod's
does not, so prod's plan never contains it, and turning it on in prod later is a values-only change.

## Release for prod

After dev applies cleanly, tag the commit: `git tag -a tf-app-dev-v2.2.0 -m "..."`. Prod
(`packages/pattern-2/tf-app-prod`) picks it up only when its `?ref=` is bumped.
