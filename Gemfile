# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.2.1"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 4.3"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "dotenv-rails", "~> 2.5"
  gem "rspec", "~> 3.8"
  gem "rspec-rails", "~> 3.8"
  gem "simplecov", "~> 0.16.1"
  gem "rspec_api_documentation", "~> 6.1"
  gem "coveralls", "~> 0.7.1", require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "guard", "~> 2.14"
  gem "guard-rspec", "~> 4.7", require: false
  gem "rubocop-rspec", "~> 1.29"
  gem "rubocop", "~> 0.59.1"
  gem "terminal-notifier-guard", "~> 1.7"
end

group :production do
  gem "sentry-raven", "~> 2.7"
end

gem "devise", "~> 4.7"

gem "active_model_serializers", "~> 0.10.7"

gem "cancancan", "~> 2.2"

gem "devise-jwt", "~> 0.5.7"

gem "responders", "~> 2.4"

gem "activeadmin", "~> 1.3"

gem "sass-rails", "~> 5.0"

gem "twilio-ruby", "~> 5.12"

gem "phonelib", "~> 0.6.24"

gem "faker", "~> 1.9"

gem "sidekiq", "~> 5.2"

gem "tzinfo-data", "~> 1.2018"

gem "capistrano", "~> 3.11"

gem "capistrano-bundler", "~> 1.4"

gem "capistrano-rails", "~> 1.4"

gem "capistrano-rvm", "~> 0.1.2"

gem "paginate-responder", "~> 1.7"

gem "kaminari", "~> 1.2"

gem "ransack", "~> 2.0"

gem "annotate", "~> 2.7"
