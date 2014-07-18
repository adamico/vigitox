source 'http://rubygems.org'
ruby "2.1.2"

gem 'rails', '4.1.4'

gem 'pg'
gem 'pg_search'

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', "~> 4.0.0"

gem "bootstrap-sass", "~> 3.2.0"
gem 'autoprefixer-rails'

gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Heroku gems
gem 'rails_12factor', group: :production
gem 'newrelic_rpm'
gem 'unicorn'
gem "unicorn-rails"
gem 'foreman'

gem 'devise', '~> 3.2.4'
gem "RedCloth"
gem "haml-rails"
gem 'kaminari'
gem 'paperclip', github: "thoughtbot/paperclip"
gem "paperclip-dropbox", github: "janko-m/paperclip-dropbox"
gem 'acts_as_list'
gem 'prawn', github: "prawnpdf/prawn"
gem 'friendly_id', github: 'FriendlyId/friendly_id'
gem 'ckeditor'
gem 'rack-cors', require: "rack/cors"
gem 'select2-rails', github: "argerim/select2-rails"

group :production do
  gem 'google-analytics-rails'
end

group :development do
  gem "pry-rails"
  gem "quiet_assets", ">= 1.0.1"
  gem 'rb-fsevent', :require => false
  gem 'terminal-notifier-guard'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'spring'
end

gem 'dotenv-rails'

group :development, :test do
  gem 'rspec-rails'
  gem "poltergeist", github: "jonleighton/poltergeist"
  gem 'railroady'
  gem 'better_errors', '~> 1.1.0'
  gem 'binding_of_caller'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara', '~> 2.1'
  gem "guard-rspec"
  gem "database_cleaner", "~> 1.3.0"
  gem "simplecov", require: false
  gem 'launchy'    # So you can do Then show me the page
end
