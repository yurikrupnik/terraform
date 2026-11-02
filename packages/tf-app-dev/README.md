# tf-app-dev

Dev Terraform app. Holds the tf-app code once (`stack/`, built from Cloud Foundation Fabric modules) and the
dev values (`main.tf`, `source = "./stack"`). Dev always runs the working copy.

```bash
npx nx run tf-app-dev:initialize
npx nx run tf-app-dev:plan
npx nx run tf-app-dev:apply
```

## Release for prod

After dev applies cleanly, tag the commit: `git tag -a tf-app-dev-v1.2.0 -m "..."`. Prod
(`packages/tf-app-prod`) picks it up only when its `?ref=` is bumped.
