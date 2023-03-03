#!/bin/sh

if [ "${RAILS_ENV}" = 'production' ] || [ "${RAILS_ENV}" = 'staging' ]; then
  SECRET_KEY_BASE=TEMPORARY_SECRET_KEY VALKYRIE_SOLR_HOST=localhost VALKYRIE_SOLR_PORT=8983 VALKYRIE_SOLR_CORE=pg bundle exec rails assets:precompile
fi