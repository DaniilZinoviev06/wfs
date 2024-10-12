source "https://rubygems.org"

ruby "3.3.4"

gem "bootsnap", require: false
gem "importmap-rails"
gem "jbuilder"
gem "puma", ">= 5.0"
gem "rails", "~> 7.1.3", ">= 7.1.3.4"
gem "redis", "~> 4.0"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem 'dotenv-rails'

# db
gem "pg", "~> 1.1"

# registration/auth
gem 'devise'
gem 'recaptcha'
gem 'omniauth'
gem "omniauth-yandex"
gem 'omniauth-vkontakte'
gem 'omniauth-google-oauth2'
gem 'activerecord-session_store'
gem "omniauth-rails_csrf_protection"

# design
gem "tailwindcss-rails", "~> 2.6"
gem 'sassc-rails'

# requests
gem 'faraday'
gem 'json'
gem 'retryable'
gem 'net-http'

# data 
gem "image_processing", ">= 1.2"

group :development, :test do
  # debugging
  gem 'byebug'
  gem "debug", platforms: %i[ mri windows ]
  gem 'better_errors'
end

group :development do
  gem "web-console"
  gem 'guard'
  gem 'guard-livereload', require: false
end
