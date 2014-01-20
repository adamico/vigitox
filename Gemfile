source 'http://rubygems.org'
ruby "2.1.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

gem 'pg'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', "~> 4.0.0"

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
#gem 'therubyracer', platforms: :ruby

gem "bootstrap-sass", "~> 3.0.3.0"

gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem "jquery-turbolinks"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use debugger
# gem 'debugger'

# Heroku gems
gem 'rails_12factor', group: :production
gem 'newrelic_rpm'
gem 'unicorn'
gem "unicorn-rails"
gem 'foreman'

gem "devise", github: "plataformatec/devise"
gem "RedCloth"
gem "haml-rails"
gem 'kaminari'
gem 'paperclip', github: "thoughtbot/paperclip"
gem "paperclip-dropbox", github: "janko-m/paperclip-dropbox"
gem 'acts_as_list'
gem 'acts_as_indexed'
gem 'stringex'
gem 'prawn', github: "prawnpdf/prawn"
gem 'friendly_id', github: 'FriendlyId/friendly_id'
gem 'ckeditor', github: "galetahub/ckeditor"
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
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem "poltergeist", github: "jonleighton/poltergeist"
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem "guard-rspec"
  gem "database_cleaner", "~> 1.2.0"
  gem "simplecov", require: false
  gem 'launchy'    # So you can do Then show me the page
end
