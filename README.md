# Spinnaker Stats Service

This is the service that collects telemetry data from customer Spinnaker
instances.

This data helps the project maintainers and the community decide where to focus
our efforts and gauge how the product is being used in the wild.

More information about the data being collected and how to request access to the
raw data is available
[on the Spinnaker website](https://spinnaker.io/community/stats/).

## Development

All commits to the `master` branch are deployed to a staging environment hosted
at https://stats-staging.spinnaker.io. See
[cloudbuild-deploy-staging.yaml](./cloudbuild-deploy-staging.yaml).

Deploying to production simply promotes the staging container to the production
environment. See
[cloudbuild-promote-staging-to-prod.yaml](cloudbuild-promote-staging-to-prod.yaml).
This is triggered by adding a tag (generally by creating a release). (Notably,
however, it doesn't push the tagged version to prod... it _always_ takes the
version from staging.)

The `stats` releases aren't connected to the Spinnaker releases, since there's
only one endpoint that gathers data from _all_ Spinnaker versions.

The data, the Cloud Run infrastructure, and the Cloud Builds all live in the
[`stats-spinnaker-io` GCP project](https://console.cloud.google.com/home/dashboard?project=stats-spinnaker-io).
