source 'https://rubygems.org'

ruby '2.4.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use Haml as the templating library
gem 'haml'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem "audited", "~> 4.3"

gem "attr_encrypted", "~> 3.0.0"

gem "figaro"

gem 'sprockets', '~> 3.7.2'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'themoviedb'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0', :group => :development
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'tzinfo-data'


  # Access an IRB console on exception pages or by using <%= console %> in views
  #gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

end

group :production do
  gem 'rubycas-client', :git => 'git://github.com/shubham7jain/rubycas-client.git'
  gem 'rails_12factor'
  gem 'pg', '~> 0.21.0'
end

# Gemfile
group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner', '1.6.1'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'simplecov', :require => false
  gem "factory_girl_rails", "~> 4.0"
  gem 'pg', '~> 0.21.0'
  gem 'rubycas-client', :git => 'git://github.com/shubham7jain/rubycas-client.git'
  gem 'rails-controller-testing'
end
