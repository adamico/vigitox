# Edit this Gemfile to bundle your application's dependencies.
# This preamble is the current preamble for Rails 3 apps; edit as needed.
source 'http://rubygems.org'
ruby "2.0.0"

gem 'rails', '4.0.0'

gem 'pg'

gem 'sass-rails', '~> 4.0.0'
gem "jquery-ui-sass-rails"
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', "~> 4.0.0"

gem "bootstrap-sass", github: "thomas-mcdonald/bootstrap-sass"
gem 'select2-rails', github: "argerim/select2-rails"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
#
# Heroku gems
gem 'rails_12factor', group: :production
gem 'newrelic_rpm'
gem 'thin'
gem 'foreman'

gem "RedCloth"

gem "devise", github: "plataformatec/devise"
gem 'simple_form', github: "plataformatec/simple_form"
gem "haml-rails"

gem 'kaminari'
gem 'paperclip'
gem 'acts_as_list'
gem 'nested_form'
gem 'acts_as_indexed'
gem 'stringex'
gem 'prawn', github: "prawnpdf/prawn"
gem 'rails3-jquery-autocomplete'
gem 'friendly_id', github: 'FriendlyId/friendly_id'

group :production do
  gem 'rack-google_analytics', require: "rack/google_analytics"
end

group :development do
  gem "pry-rails"
  gem "quiet_assets", ">= 1.0.1"
  gem 'rb-fsevent', :require => false
  gem 'terminal-notifier-guard'
end

group :development, :test do
  gem 'rspec-rails'
  gem "zeus"
  gem "poltergeist", github: "jonleighton/poltergeist"
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem "guard-rspec"
  gem "database_cleaner", github: "bmabey/database_cleaner", tag: "v1.0.0.RC1"
  gem "simplecov", :require => false
  gem 'launchy'    # So you can do Then show me the page
end
