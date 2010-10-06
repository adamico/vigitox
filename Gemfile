# Edit this Gemfile to bundle your application's dependencies.
# This preamble is the current preamble for Rails 3 apps; edit as needed.
source 'http://rubygems.org'

gem 'rails', '3.0.0'
gem 'haml'
gem "RedCloth"
gem 'meta_where'
gem 'meta_search'
gem 'formtastic', '~> 1.1.0'
gem 'will_paginate', '3.0.pre2'
gem 'paperclip'
gem 'prawn'
gem 'acts_as_list'
gem 'devise', '~> 1.1.rc2'

gem 'pg', :group => :production

group :development do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem "ruby-graphviz"
  gem "rails-erd"
  gem "nifty-generators"
  gem "rails3-generators"
  gem "haml-rails"
  gem "wirble"
  gem "hirb"
  gem 'annotate-models', '1.0.4'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails', ">= 2.0.0.beta.17"
end

group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'rspec-rails', ">= 2.0.0.beta.17"
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
  gem 'pickle'
  gem 'factory_girl_rails'
end
