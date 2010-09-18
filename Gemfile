source 'http://rubygems.org'

gem 'rails', '3.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby', :require => 'sqlite3'



gem 'haml-rails', ">= 0.0.2"
gem 'will_paginate'
gem 'formtastic'
# Console display helpers
gem 'awesome_print'
gem 'looksee'
gem 'wirble'
gem 'nifty-generators'

group :test, :cucumber do
gem 'capybara', '>= 0.3.8'
gem 'cucumber-rails', '>= 0.3.2'
gem 'database_cleaner', '>= 0.5.2'
gem 'factory_girl_rails', '>= 1.0.0'
gem 'launchy', '>= 0.3.5'
gem 'rspec-rails', '>= 2.0.0.beta.12'
gem 'spork', '>= 0.8.4'
end

group :test, :cucumber, :development do
gem 'factory_girl_generator', '>= 0.0.1'
gem 'faker'
end

group :test, :cucumber, :development, :staging do
# For debugging, use one of the following
# gem 'ruby-debug' # For Ruby 1.8
# gem 'ruby-debug19' # For Ruby 1.9
end
