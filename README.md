# README

This is an application used for testing the state of [Hyrax](https://github.com/samvera/hyrax). The `main` branch is automatically deployed to [dev.nurax.samvera.org](https://dev.nurax.samvera.org) every time there is a push to Hyrax's `main` branch. The `stable` branch is pinned to the latest stable release of Hyrax, and is deployed much less often, only when there has been a new release, to [stable.nurax.samvera.org](https://stable.nurax.samvera.org). The `pg` branch is used to demonstrate Hyrax's Valkyrie PostgreSQL adapter configuration. It tracks the `main` branch of Hyrax, and is deployed to [pg.nurax.samvera.org](https://pg.nurax.samvera.org)

## Running with Docker

See [the docker notes](DOCKER.md) to learn about running Nurax in Docker.

## Infrastructure

The nurax servers are built and deployed using [terraform](https://github.com/samvera-labs/nurax-terraform).

## Auto-deploy process

The `main` branch (which supports Nurax's `dev` instance) and `pg` branch are deployed every time there is a push to Hyrax's `main` branch. The `stable` branch is deployed every time there is a new tagged Hyrax release.

## Questions

Please direct questions about this code or the servers where it runs to the `#nurax` channel on Samvera slack.
