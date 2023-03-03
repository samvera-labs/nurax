#!/bin/sh

if [ "${RAILS_ENV}" = 'production' ] || [ "${RAILS_ENV}" = 'staging' ]; then
  echo "Bundle install without development or test gems."
  bundle config --local without development test
fi

bundle install 
