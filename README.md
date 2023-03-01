# README

This is an application used for testing the state of [Hyrax](https://github.com/samvera/hyrax). The `main` branch is pinned to Hyrax `main`, and is automatically deployed to [dev.nurax.samvera.org](https://dev.nurax.samvera.org) once per day. The `nurax-stable` branch is pinned to the latest stable release of Hyrax, and is deployed much less often, only when there has been a new release, to [stable.nurax.samvera.org](https://stable.nurax.samvera.org).

## Running with Docker

See [the docker notes](DOCKER.md) to learn about running Nurax in Docker.

## Infrastructure

The nurax servers are built using the [terraform](https://github.com/samvera-labs/nurax-terraform) ansible roles.

## Auto-deploy process

The `main` branch (which supports Nurax's `dev` instance) is deployed every time there is a push to Hyrax's `main` branch. The `stable` branch is deployed every time there is a new Hyrax release.

## Questions

Please direct questions about this code or the servers where it runs to the `#nurax` channel on Samvera slack.
