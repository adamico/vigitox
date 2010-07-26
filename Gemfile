# Edit this Gemfile to bundle your application's dependencies.
# This preamble is the current preamble for Rails 3 apps; edit as needed.
source 'http://rubygems.org'

gem 'rails', '3.0.0.beta4'

group :development do
  gem "nifty-generators"
  gem "rails3-generators"
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

gem 'haml'
gem 'will_paginate', '3.0.pre'
gem 'formtastic', :git => "http://github.com/justinfrench/formtastic.git", :branch => "rails3"
gem 'paperclip'
gem 'meta_search'
gem 'prawn'
gem 'ryanb-acts-as-list', :require => 'acts_as_list'
gem 'devise', '1.1.rc2'
gem 'repeated_auto_complete', :git => "http://github.com/jasherai/auto_complete.git", :branch => "jquery"

group :test do
  gem 'factory_girl_rails'
end

group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'rspec-rails'
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
  gem 'pickle', :git => 'http://github.com/codegram/pickle.git'
  gem 'factory_girl_rails'
end
