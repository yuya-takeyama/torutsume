source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.0.2'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'bootstrap-sass-rails', '~> 3.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'json', '>= 1.7'
gem 'slim-rails', '~> 2.0.3'
gem 'friendly_id', '~> 5.0.1'
gem 'omniauth', '~> 1.1.4'
gem 'omniauth-facebook', '~> 1.5.1'
gem 'devise', '~> 3.2.1'
gem 'figaro', '~> 0.7.0'
gem 'dee-rails', '~> 0.0.1'
gem 'rugged', git: 'git://github.com/libgit2/rugged.git', branch: 'development', submodules: true

group :development, :test do
  gem 'spring', '~> 1.0.0'
  gem 'rspec-rails', '~> 2.0'
  gem 'guard-rspec', '~> 4.2.3'
  gem 'spring-commands-rspec', '~> 1.0.0', require: false

  gem 'pry-rails', '~> 0.3.2'
  gem 'pry-doc', '~> 0.4.6'
  gem 'pry-stack_explorer', '~> 0.4.9'
  gem 'pry-byebug', '~> 1.2.0'

  gem 'better_errors', '~> 1.0.1'
  gem 'binding_of_caller', '~> 0.7.2'

  gem 'factory_girl_rails', '~> 4.2.1'
  gem 'database_rewinder', '~> 0.0.2'

  gem 'coveralls', require: false
end

local_gemfile = File.join(File.dirname(__FILE__), 'Gemfile.local')
if File.exists?(local_gemfile)
  puts "Loading Gemfile.local ..." if $DEBUG # `ruby -d` or `bundle -v`
  instance_eval File.read(local_gemfile)
end
