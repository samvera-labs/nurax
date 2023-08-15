source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby '2.7.4'

gem 'bcrypt_pbkdf'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'devise-guests', '0.8.1'
gem 'dotenv-rails'
gem 'ed25519'
gem 'hydra-role-management'
gem 'hyrax', github: 'samvera/hyrax', ref: ENV.fetch('HYRAX_TARGET', 'main')
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'okcomputer'
gem 'pg'
gem 'puma'
gem 'rails', '~> 6.1'
gem 'riiif', '~> 2.1'
gem 'rsolr', '>= 1.0', '< 3'
gem 'sass-rails', '~> 6.0'
gem 'sidekiq', '~> 7.1'
gem 'turbolinks', '~> 5'
gem 'twitter-typeahead-rails', '0.11.1.pre.corejavascript'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'better_errors' # add command line in browser when errors
  gem 'binding_of_caller' # deeper stack trace used by better errors

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'fcrepo_wrapper'
  gem "pry-byebug"
  gem "pry-doc"
  gem "pry-rails"
  gem "pry-rescue"
  gem 'rspec-rails'
  gem 'solr_wrapper', '>= 0.3'
end
