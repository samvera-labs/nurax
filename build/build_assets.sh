#!/bin/sh

if [ "${RAILS_ENV}" = 'production' ] || [ "${RAILS_ENV}" = 'staging' ]; then
  SECRET_KEY_BASE=TEMPORARY_SECRET_KEY DATABASE_URL='nulldb://nulldb' bundle exec rails assets:precompile
fi