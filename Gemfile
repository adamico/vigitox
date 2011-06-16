# Edit this Gemfile to bundle your application's dependencies.
# This preamble is the current preamble for Rails 3 apps; edit as needed.
source 'http://rubygems.org'

gem 'rails', '3.0.9.rc3'
gem 'haml'
gem 'sass'
gem "RedCloth"
gem 'meta_where'
gem 'meta_search'
gem 'simple_form'
gem 'kaminari'
gem 'paperclip'
gem 'acts_as_list'
gem 'devise'
gem 'nested_form'
gem 'acts_as_indexed'
gem 'stringex'
gem 'wymeditor'
gem 'decent_exposure'

group :production do
  gem 'pg'
  gem 'rack-google_analytics', :require => "rack/google_analytics"
end

group :development do
  gem 'sqlite3'
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
  gem 'rspec-rails', "~> 2.1"
end

group :test do
  gem 'factory_girl_rails', "~> 1.1.beta1"
  gem "autotest"
  gem 'spork', '~> 0.9.0.rc'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'pickle'
end

group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'rspec-rails', "~> 2.1"
  gem 'launchy'    # So you can do Then show me the page
  gem 'factory_girl_rails', "~> 1.1.beta1"
  gem 'pickle'
end
