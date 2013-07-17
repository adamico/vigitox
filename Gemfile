# Edit this Gemfile to bundle your application's dependencies.
# This preamble is the current preamble for Rails 3 apps; edit as needed.
source 'http://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.13'

group :assets do
  gem 'sass-rails', "  ~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', '>=1.0.3'
  gem "bootstrap-sass", github: "thomas-mcdonald/bootstrap-sass"
end

gem "jquery-ui-rails"
gem 'jquery-rails'
gem 'select2-rails', github: "argerim/select2-rails"

gem "RedCloth"

gem 'simple_form'
gem 'kaminari'
gem 'paperclip'
gem 'acts_as_list'
gem 'devise'
gem 'nested_form'
gem 'acts_as_indexed'
gem 'stringex'
gem "ckeditor"
gem 'prawn'
gem 'inherited_resources'
gem 'pg'
gem 'coffee-filter'
gem 'rails3-jquery-autocomplete'
gem 'friendly_id'
gem 'newrelic_rpm', "~> 3.5.3.25"

group :production do
  gem 'rack-google_analytics', require: "rack/google_analytics"
end

group :development do
  gem "haml-rails"
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
  gem 'database_cleaner'
  gem "simplecov", :require => false
  gem 'launchy'    # So you can do Then show me the page
end
