# tf-app

GCS bucket + Pub/Sub topic, deployed to dev and prod from the same code.

```
modules/app/          shared code (resources, variables, outputs) — edit here
envs/dev/main.tf      thin root: provider + module call (identical across envs)
envs/dev/terraform.tfvars   dev values
envs/prod/main.tf     same as dev
envs/prod/terraform.tfvars  prod values
```

Each env folder is its own Terraform root, so dev and prod keep separate state.

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
