# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.2.3'
# Use Puma as the app server
gem 'puma', '~> 5.1', '>= 5.1.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 1.1', '>= 1.1.1'

gem 'active_model_serializers', '~> 0.10.0'
gem 'colorize', '~> 0.8.1'
gem 'rails-healthcheck', '~> 1.2'
gem 'rest-client', '~> 2.1.0'

gem 'sidekiq', '~> 6.1.3'
gem 'sidekiq-throttled', '~> 0.13.0'

gem 'fedex', '~> 3.10', '>= 3.10.11'

gem 'rswag-api', '~> 2.4'
gem 'rswag-ui', '~> 2.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rswag-specs'
  gem 'rubocop', '~> 1.6', '>= 1.6.1', require: false
  gem 'rubocop-performance', '~> 1.9', '>= 1.9.1', require: false
  gem 'rubocop-rails', '~> 2.9', '>= 2.9.1', require: false
  gem 'rubocop-rspec', '~> 2.1', require: false
  gem 'shoulda-matchers'
  gem 'vcr', '~> 6.0'
  gem 'webmock', '~> 3.12', '>= 3.12.2'
end

group :test do
  gem 'rspec-sidekiq', '~> 3.1'
  gem 'simplecov'
end

group :development do
  gem 'annotate'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
