# pattern-3-tf-app-module

Pattern 3 (everything is a module): the tf-app code and nothing else. No values, no state, not deployable on
its own. Built from Cloud Foundation Fabric `gcs` + `pubsub` modules.

Every change is released as a tag (`git tag -a tf-app-module-v1.2.0 -m "..."`). `pattern-3-tf-app-dev` and
`pattern-3-tf-app-prod` each pin a tag; dev sees a change only after it is tagged and dev's `?ref=` is bumped.

```bash
npx nx run pattern-3-tf-app-module:fmt
npx nx run pattern-3-tf-app-module:initialize
npx nx run pattern-3-tf-app-module:validate
```
