# pattern-2-tf-app-dev

Pattern 2 (prod reuses dev code), dev app. Holds the tf-app code once (`stack/`, built from Cloud Foundation
Fabric modules) and the dev values (`main.tf`, `source = "./stack"`). Dev always runs the working copy.

```bash
npx nx run pattern-2-tf-app-dev:initialize
npx nx run pattern-2-tf-app-dev:plan
npx nx run pattern-2-tf-app-dev:apply
```

## Release for prod

After dev applies cleanly, tag the commit: `git tag -a tf-app-dev-v1.2.0 -m "..."`. Prod
(`packages/pattern-2/tf-app-prod`) picks it up only when its `?ref=` is bumped.
