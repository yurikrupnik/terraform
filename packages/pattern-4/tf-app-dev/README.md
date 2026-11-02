# pattern-4-tf-app-dev

Pattern 4 (one monorepo), dev app. Runs the shared stack (`../stacks/tf-app`) by relative path, so dev always
runs the latest commit. Dev values in `terraform.tfvars`.

```bash
npx nx run pattern-4-tf-app-dev:initialize
npx nx run pattern-4-tf-app-dev:plan
npx nx run pattern-4-tf-app-dev:apply
```

`project.json` declares `implicitDependencies: ["pattern-4-stacks-tf-app"]`, so a stack change marks this app
as affected (`nx affected`), while `tf-app-prod` is affected only when its own files change.
