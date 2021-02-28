source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# ORM extension that logs all changes to your models
gem "audited", "~> 4.9"
# Flexible authentication solution
gem 'devise'
gem 'devise_token_auth', github: 'lynndylanhurley/devise_token_auth'

# CanCan is an authorization library for Ruby on Rails which restricts what resources a given user is allowed to access.
gem "cancancan"

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  # factory_bot is a fixtures replacement with a straightforward definition syntax
  gem 'factory_bot_rails'
  # The main goal of the project is to provide an easy way to maintain FactoryBot inside your project in a good shape.
  gem 'factory_trace'
  # Set of matchers and helpers to allow you test your APIs responses like a pro.
  gem 'rspec-json_expectations'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Generate a diagram based on your application's Active Record models
  gem 'rails-erd'
end

group :test do
  # Shoulda Matchers provides RSpec- and Minitest-compatible one-liners to test common Rails functionality that, if written by hand, would be much longer, more complex, and error-prone.
  gem 'shoulda-matchers', '~> 4.0'
  # SimpleCov is a code coverage analysis tool for Ruby
  gem 'simplecov', require: false
  # Database Cleaner is a set of gems containing strategies for cleaning your database in Ruby.
  gem 'database_cleaner-active_record'
end

gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
# Generates Brazilian CPF and CNPJ numbers for use in testing
gem 'cpf_faker'

# admin panel
gem 'rails_admin_rollincode', '~> 1.0'
gem 'rails_admin', '~> 2.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
