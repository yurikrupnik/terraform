# tf-app

GCS bucket + Pub/Sub topic, deployed to dev and prod from the same code.

```
modules/app/          shared code (resources, variables, outputs) — edit here
envs/dev/main.tf      thin root: provider + module call, source = ../../modules/app (working copy)
envs/dev/terraform.tfvars   dev values
envs/prod/main.tf     same root, source pinned to a git tag: ...//packages/tf-app/modules/app?ref=tf-app-vX.Y.Z
envs/prod/terraform.tfvars  prod values
```

Each env folder is its own Terraform root, so dev and prod keep separate state.

## Releases

Module changes reach dev immediately and prod only through a tag:

1. Merge the module change; `plan:dev` / `apply:dev`.
2. Tag: `git tag -a tf-app-v1.1.0 -m "..."` (prefix `tf-app-` keeps per-module tag series in the monorepo).
3. Bump `?ref=` in `envs/prod/main.tf`, then `initialize:prod` (re-downloads the module), `plan:prod`, `apply:prod`.

This is the one-repo layout (option 4 in the promotion doc). Options 2 and 3 as separate repos:
`../promotion-demo/` (outside this workspace).

The `git::file:///...` source is for this local demo (no remote). With GitHub it becomes
`git::https://github.com/<org>/terraform.git//packages/tf-app/modules/app?ref=tf-app-v1.0.0`.

## Usage

Every env-scoped target defaults to `dev`; prod requires `:prod` explicitly.

```bash
npx nx run tf-app:initialize:dev
npx nx run tf-app:plan:dev
npx nx run tf-app:apply:dev

npx nx run tf-app:initialize:prod
npx nx run tf-app:plan:prod
npx nx run tf-app:apply:prod
```

Other targets: `validate`, `providers`, `destroy` (same `:dev` / `:prod` configurations), `fmt` (whole project).
