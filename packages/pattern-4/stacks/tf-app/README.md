# pattern-4-stacks-tf-app

Pattern 4 (one monorepo): the tf-app code, once, next to both environments. Built from Cloud Foundation
Fabric modules; takes one typed `config` object (schema and validations in `variables.tf`). Not deployable on
its own.

- `tf-app-dev` uses it by relative path, so dev always runs the latest commit.
- `tf-app-prod` pins a repo-wide release tag (`lz-vX.Y.Z`).

```bash
npx nx run pattern-4-stacks-tf-app:validate
```
